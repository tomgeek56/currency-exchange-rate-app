//
//  Request.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct Request {
    static func makeUrl(method: String, params: [String: Any]?) -> URL? {
        
        let method =  "\(Config.BaseUrl)/\(method)"
        
        guard let url = URL(string: method) else {
            return nil
        }
        
        return url
    }
}
