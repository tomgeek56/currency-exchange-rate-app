//
//  Service.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import Reachability

struct Service {
    private static let sessionConfiguration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsExpensiveNetworkAccess = true
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 60
        config.timeoutIntervalForResource = 1200
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return config
    }()
    
    static func get<T: Codable, R: Requestable>(request: R, completion: @escaping (T) -> Void, failure: @escaping () -> Void, noInternetConnection: @escaping () -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                if try Reachability().connection == .unavailable {
                    noInternetConnection()
                    return
                }
            } catch {}
            
            let session = URLSession(configuration: Service.sessionConfiguration)
           
            guard let url = request.getUrl() else {
                failure()
                return
            }
            
            session.dataTask(with: url) { (data, _, error) in
                if let _ = error {
                    failure()
                    return
                }
                
                guard let data = data else {
                    failure()
                    return
                }
                
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch {
                    print("Unexpected error: \(error).")
                    failure()
                }
                
            }.resume()
        }
        
    }
}
