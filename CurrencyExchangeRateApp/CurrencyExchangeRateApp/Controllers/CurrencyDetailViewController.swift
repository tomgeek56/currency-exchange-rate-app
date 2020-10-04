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
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.tableHeaderView = UIView(frame: CGRect.zero)
        self.tableView.registerNibAndReuseIdentifierForCell(cell: CurrencyDetailTableViewCell.self)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        currencyDetailViewModel?.currencyBase.addObserver(listener: { (value) in
            self.labelBaseCurrency.text = value.name
            self.labelBaseCurrencyDetail.text = value.getStringRepresentation()
        })
        
        currencyDetailViewModel?.secondCurrency.addObserver(listener: { (value) in
            self.labelSecondCurrency.text = value.name
            self.labelSecondCurrencyDetail.text = value.getStringRepresentation()
        })
        
        currencyDetailViewModel?.results.addObserver(listener: { (_) in
            self.tableView.reloadData()
        })
        
    }
    
}

extension CurrencyDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyDetailViewModel?.results.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CurrencyDetailTableViewCell.identifier, for: indexPath) as? CurrencyDetailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(currencyDetailViewModel!.results.value[indexPath.row])
        
        return cell
    }
    
}
