//
//  CurrencyDetailViewController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelBaseCurrency: UILabel!
    @IBOutlet weak var labelBaseCurrencyDetail: UILabel!
    @IBOutlet weak var labelSecondCurrency: UILabel!
    @IBOutlet weak var labelSecondCurrencyDetail: UILabel!
    
    var currency: Currency?
    var currencyDetailViewModel: CurrencyDetailViewModel?
    var dataSource = TableDataSource<CurrencyDetailResult, CurrencyDetailTableViewCell>()

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyDetailViewModel = CurrencyDetailViewModel(self.currency)
        currencyDetailViewModel?.fetchData()
        loadUI()
    }
    
    func loadUI() {
        
        currencyDetailViewModel?.errorHandler = { (message) in
            self.showErrorAlert(message)
        }
        
        self.tableView.setDataSourceAndDelegate(delegate: dataSource)
        self.tableView.initView(CurrencyDetailTableViewCell.self)
        
        currencyDetailViewModel?.currencyBase.addObserver(listener: { (value) in
            self.labelBaseCurrency.text = value.name
            self.labelBaseCurrencyDetail.text = value.getStringRepresentation()
        })
        
        currencyDetailViewModel?.secondCurrency.addObserver(listener: { (value) in
            self.labelSecondCurrency.text = value.name
            self.labelSecondCurrencyDetail.text = value.getStringRepresentation()
        })
        
        currencyDetailViewModel?.results.addObserver(listener: { (currencies) in
            self.dataSource.setData(data: currencies)
            self.tableView.reloadData()
        })
        
    }
}
