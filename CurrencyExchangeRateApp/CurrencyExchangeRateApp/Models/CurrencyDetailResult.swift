//
//  CurrencyDetailResult.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

struct CurrencyDetailResult {
    var date: String
//    var baseCurrency: String
//    var secondCurrency: String
//    var secondCurrencyValue: Double
//    var baseCurrencyValue: Double = 1
    var baseCurrency: Currency
    var secondCurrency: Currency

}

extension CurrencyDetailResult {
    
    static func sort(_ items: inout [CurrencyDetailResult]) {
        items.sort { (c1: CurrencyDetailResult, c2: CurrencyDetailResult) -> Bool in
            if let date1 = c1.date.getDate(), let date2 = c2.date.getDate() {
                return date1 > date2
            }
            return false
        }
    }
}
