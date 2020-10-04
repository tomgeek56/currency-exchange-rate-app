//
//  CurrencyDetail.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

struct CurrencyDetail: Codable {
    var rates: [String: [String: Double]]
    var start_at: String
    var end_at: String
    var base: String

}

extension CurrencyDetail {
    func getResults() -> [CurrencyDetailResult] {
        return self.rates.map { (key, value) -> CurrencyDetailResult in
            
            let firstCurrency = Currency(name: base, value: 1.0)
            let secondCurrency = Currency(name: Array(value.keys).first!, value: Array(value.values).first!)
            
            return CurrencyDetailResult(date: key, baseCurrency: firstCurrency, secondCurrency: secondCurrency)
        }
    }

}
