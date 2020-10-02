//
//  CurrencyDetailViewModel.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

struct CurrencyDetailViewModel {
    var currency: Dynamic<Currency>
    
    init?(_ currency: Currency?) {
        guard let currency = currency else {
            return nil
        }
        self.currency = Dynamic(currency)
    }
    
    func fetchData() {
        let request = Request(methodName: "history", params: ["base": "PLN"])
        
        Service.get(request: request, completion: { (_: CurrencyList) in
//                  self.currencies.value = response.getCurrencies()
              }, failure: {
              
              }, noInternetConnection: {
              
              })
    }
}
