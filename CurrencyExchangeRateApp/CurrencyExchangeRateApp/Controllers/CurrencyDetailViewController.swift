//
//  CurrencyDetailViewController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: BaseViewController {
    
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
        
        currencyDetailViewModel?.currencyBaseTitle.addObserver(listener: { (value) in
            self.labelBaseCurrency.text = value
        })
        
        currencyDetailViewModel?.currencyBaseValue.addObserver(listener: { (value) in
            self.labelBaseCurrencyDetail.text = "\(value)"
        })
        
        currencyDetailViewModel?.secondCurrencyTitle.addObserver(listener: { (value) in
            self.labelSecondCurrency.text = "\(value)"
        })
        
        currencyDetailViewModel?.secondCurrencyValue.addObserver(listener: { (value) in
            self.labelSecondCurrencyDetail.text = "\(value)"
        })
    }
    
}

extension CurrencyDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyDetailViewModel?.results.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        
        //        cell.configure(currencyListViewModel.currencies.value[indexPath.row])
        
        return cell
    }
    
}
