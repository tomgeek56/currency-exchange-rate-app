//
//  CurrencyList.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct CurrencyList: Codable {

    var rates: [String: Double]
    let base: String?
    let date: String?
}

extension CurrencyList {

}
