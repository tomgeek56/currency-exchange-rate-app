//
//  CurrencyService.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct CurrencyService {
    
    struct CurrencyListRequest: Requestable {
        
        func getUrl() -> URL? {
            return Request.makeUrl(method: "latest", params: ["base": "PLN"])
        }
        
    }
    
    static func getCurrenciesList(completion: @escaping (CurrencyList) -> Void, failure:  @escaping () -> Void, noInternetConnection: @escaping  () -> Void) {
//        Service.get { (list: CurrencyList) in
//            completion(list)
//        }
        
        Service.get(request: CurrencyService.CurrencyListRequest(), completion: { (response: CurrencyList) in
            completion(response)
        }, failure: failure, noInternetConnection: noInternetConnection)
    }
}
