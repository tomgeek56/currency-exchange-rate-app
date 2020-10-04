//
//  Error.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 04/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

enum ErrorType {
    case noInternetConnection
    case requestFailure
}

struct ErrorRequest {
    var errorType: ErrorType
    
    func getMeesage() -> String {
        switch self.errorType {
        case .noInternetConnection:
            return R.string.localizable.no_internet_connection()
        case .requestFailure:
            return R.string.localizable.server_error()
        }
    }
}
