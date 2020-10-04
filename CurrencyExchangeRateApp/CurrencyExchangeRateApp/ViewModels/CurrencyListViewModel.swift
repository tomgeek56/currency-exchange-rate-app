//
//  CurrencyListViewModel.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct CurrencyListViewModel {
    
    var currencies: Dynamic<[Currency]>
    var errorHandler: ((String) -> Void)?
    
    init() {
        self.currencies = Dynamic([])
    }
    
    func fetchData() {
        
        CurrencyService.getCurrenciesList(baseCurrency: Config.BASE_CURRENCY, completion: { (response) in
            self.currencies.value = response.getCurrencies()
        }, failure: { (error) in
            self.errorHandler?(error.getMeesage())
        })
        
    }
}
