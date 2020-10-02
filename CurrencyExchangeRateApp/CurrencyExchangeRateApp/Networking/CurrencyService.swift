//
//  CurrencyService.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct CurrencyService {
    static func getCurrenciesList(baseCurrency: String, completion: @escaping (CurrencyList) -> Void, failure:  @escaping () -> Void, noInternetConnection: @escaping  () -> Void) {
        
        let request = Request(methodName: "latest", params: ["base": baseCurrency])
        
        Service.get(request: request, completion: { (response: CurrencyList) in
            completion(response)
        }, failure: failure, noInternetConnection: noInternetConnection)
        
    }
}
