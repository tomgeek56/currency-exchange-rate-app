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
        Service.get(request: CurrencyService.CurrencyListRequest(), completion: { (response: CurrencyList) in
            self.currencies.value = response.getCurrencies()
        }, failure: {
        
        }, noInternetConnection: {
        
        })
        
    }
}
