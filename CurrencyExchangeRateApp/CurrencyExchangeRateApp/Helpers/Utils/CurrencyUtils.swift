//
//  StringUtils.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 03/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

extension Double {
    func getCurrencyRepresentation(for currencyName: String) -> String {
        return "\(String(format: "%.2f", self)) \(currencyName)"
    }
}
