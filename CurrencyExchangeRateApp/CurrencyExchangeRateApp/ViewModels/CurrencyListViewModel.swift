//
//  CurrencyListViewModel.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyListViewModel {
    
    var currencies: Dynamic<[Currency]>
    var errorHandler: ((String) -> Void)?
    
    init() {
        self.currencies = Dynamic([])
    }
    
    @objc func pullToRefreshAction() {
      fetchData()
    }
    
    func fetchData() {
        
        CurrencyService.getCurrenciesList(baseCurrency: Config.BASE_CURRENCY, completion: { (response) in
            self.currencies.value = response.getCurrencies()
        }, failure: { (error) in
            self.errorHandler?(error.getMeesage())
        })
        
    }
}
