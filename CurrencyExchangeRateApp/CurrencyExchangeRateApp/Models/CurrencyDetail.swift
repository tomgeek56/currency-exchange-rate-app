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
            return CurrencyDetailResult(date: key, baseCurrency: base, secondCurrency: Array(value.keys).first!, value: Array(value.values).first!)
        }
    }
}
