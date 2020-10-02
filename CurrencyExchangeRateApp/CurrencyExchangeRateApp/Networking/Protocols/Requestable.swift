//
//  Request.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

protocol Requestable {
    init(methodName: String, params: [String: Any]?)
    func getUrl() -> URL?
}
