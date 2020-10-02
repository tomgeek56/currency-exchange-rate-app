//
//  Dynamic.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit
import Foundation

class Dynamic <T> {
    
    var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
        
    func addObserver(listener: @escaping (T) -> Void) {
        self.listener = listener
        self.listener?(value)
    }

}

class DynamicOptional <T> {
    
    var listener: ((T?) -> Void)?
    var value: T? {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
    
    init() {}
    
    func addObserver(listener: @escaping (T?) -> Void) {
        self.listener = listener
        if let value = self.value {
            self.listener?(value)
        }
    }

}
