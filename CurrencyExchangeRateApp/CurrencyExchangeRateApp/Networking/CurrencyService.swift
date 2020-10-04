//
//  CurrencyService.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct CurrencyService {
    static func getCurrenciesList(baseCurrency: String, completion: @escaping (CurrencyList) -> Void, failure:  @escaping (ErrorRequest) -> Void) {
        
        let request = Request(methodName: "latest", params: ["base": baseCurrency])
        
        Service.get(request: request, completion: { (response: CurrencyList) in
            completion(response)
        }, failure: failure)
        
    }
    
    static func getCurrencyDetail(baseCurrency: String, secondCurrency: String, from: Date, to: Date, completion: @escaping (CurrencyDetail) -> Void, failure:  @escaping (ErrorRequest) -> Void) {
        
        var params = [String: Any]()
        params["base"] = baseCurrency
        params["start_at"] = Request.getDateRequestFormat(date: from)
        params["end_at"] = Request.getDateRequestFormat(date: to)
        params["symbols"] = secondCurrency
        
        let request = Request(methodName: "history", params: params)
        
        Service.get(request: request, completion: { (response: CurrencyDetail) in
            completion(response)
        }, failure: failure)
        
    }
}
