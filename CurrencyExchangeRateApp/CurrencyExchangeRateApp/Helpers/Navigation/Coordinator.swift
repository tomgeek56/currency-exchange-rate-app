//
//  Coordinator.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

protocol Coordinator {
    var children: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
