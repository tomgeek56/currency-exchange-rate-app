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
    var currencyBase: Dynamic<Currency>
    var secondCurrency: Dynamic<Currency>
    
    var errorHandler: ((String) -> Void)?

    init?(_ currency: Currency?) {
        guard let currency = currency else {
            return nil
        }
        
        self.currency = Dynamic(currency)
        self.results = Dynamic([])
        self.currencyBase = Dynamic(Currency(name: Config.BASE_CURRENCY, value: 1.0))
        self.secondCurrency =  Dynamic(currency)
    }
    
    //Range from previous Monday to Today - this is way I add 6
    func getDatesRangeFromPreviousMonday(_ date: Date) -> (from: Date, to: Date) {
        
        let numberOfDaysFromMonday = date.getDatesFromPreviousMonday()
        let fromDate = date.getDateBySubstractingDays(numberOfDays: numberOfDaysFromMonday) ?? Date()
        
        return (fromDate, date)
    }
    
    func fetchData() {
        let dates = getDatesRangeFromPreviousMonday(Date())
        
        CurrencyService.getCurrencyDetail(baseCurrency: Config.BASE_CURRENCY, secondCurrency: self.currency.value.name, from: dates.from, to: dates.to, completion: { (response) in
            var result = response.getResults()
            CurrencyDetailResult.sort(&result)
            self.results.value = result
        }, failure: { (error) in
            self.errorHandler?(error.getMeesage())
        })
    }
}
//test changes dev 2
