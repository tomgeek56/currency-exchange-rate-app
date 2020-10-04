//
//  Request.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

struct Request: Requestable {
    fileprivate var params: [String: Any]
    fileprivate var methodName: String
    
    init(methodName: String, params: [String: Any]?) {
        self.params = params ?? [:]
        self.methodName = methodName
    }
    
    func getUrl() -> URL? {
        return Request.makeUrl(method: self.methodName, params: self.params)
    }
    
}

extension Request {
    static func makeUrl(method: String, params: [String: Any]) -> URL? {
        
        let method =  "\(Config.BASE_URL)/\(method)?\(getParamsUrl(params: params))"
        
        guard let url = URL(string: method) else {
            return nil
        }
        
        return url
    }
    
    static func getParamsUrl(params: [String: Any]) -> String {
        
        var data = [String]()
        params.forEach({ (key, value) in
            data.append(key + "=\(value)")
        })
        
        return data.map { String($0) }.joined(separator: "&")
        
    }
    
    static func getDateRequestFormat(date: Date) -> String {
        return Date.dateFormatter.string(from: date)
        
    }
}
