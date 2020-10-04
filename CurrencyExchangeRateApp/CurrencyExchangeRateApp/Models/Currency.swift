//
//  Currency.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct Currency: Codable {
    var name: String
    var value: Double
}

extension Currency {
    func getStringRepresentation() -> String {
        return "\(self.value.getCurrencyRepresentation(for: self.name))"
    }
}
