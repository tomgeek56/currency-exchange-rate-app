//
//  CurrencyDetailViewModel.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

struct CurrencyDetailViewModel {
    
    var currency: Dynamic<Currency>
    var results: Dynamic<[CurrencyDetailResult]>
    var currencyBaseTitle: Dynamic<String>
    var currencyBaseValue: Dynamic<Double>
    var secondCurrencyTitle: Dynamic<String>
    var secondCurrencyValue: Dynamic<Double>
    
    init?(_ currency: Currency?) {
        guard let currency = currency else {
            return nil
        }
        
        self.currency = Dynamic(currency)
        self.results = Dynamic([])
        
        self.currencyBaseTitle = Dynamic(Config.BASE_CURRENCY)
        self.currencyBaseValue = Dynamic(1.0)
        self.secondCurrencyTitle = Dynamic(currency.name)
        self.secondCurrencyValue = Dynamic(currency.value)
    }
    
    func fetchData() {
        CurrencyService.getCurrencyDetail(baseCurrency: Config.BASE_CURRENCY, secondCurrency: self.currency.value.name, from: Date(), to: Date(), completion: { (response) in
            self.results.value = response.getResults()
        }, failure: {
            
        }, noInternetConnection: {
            
        })
    }
}
