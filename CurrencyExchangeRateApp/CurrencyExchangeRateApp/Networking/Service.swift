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
    
    static func parse<T: Codable>(_ data: Data?) -> T? {
        
        guard let data = data else {
            return nil
        }
        
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            return json
        } catch {
            print("Unexpected error: \(error).")
            return nil
        }
        
    }
    
    static func get<T: Codable, R: Requestable>(request: R, completion: @escaping (T) -> Void, failure: @escaping (ErrorRequest) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                if try Reachability().connection == .unavailable {
                    DispatchQueue.main.async {
                        failure(ErrorRequest(errorType: .noInternetConnection))
                    }
                    return
                }
            } catch {}
            
            let session = URLSession(configuration: Service.sessionConfiguration)
            
            guard let url = request.getUrl() else {
                DispatchQueue.main.async {
                    failure(ErrorRequest(errorType: .requestFailure))
                }
                return
            }
            
            session.dataTask(with: url) { (data, _, error) in
                DispatchQueue.main.async {
                    
                    if let _ = error {
                        
                        failure(ErrorRequest(errorType: .requestFailure))
                        return
                    }
                    
                    guard let data = data else {
                        failure(ErrorRequest(errorType: .requestFailure))
                        return
                    }
                    
                    //let json:T =  completion(Service.parse(data)
                    
                    if let json: T = Service.parse(data) {
                        completion(json)
                        
                    } else {
                        failure(ErrorRequest(errorType: .requestFailure))
                    }
                    
                }
                
            }.resume()
        }
        
    }
}
