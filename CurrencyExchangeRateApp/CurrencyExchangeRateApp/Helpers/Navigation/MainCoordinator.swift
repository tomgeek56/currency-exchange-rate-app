//
//  MainCoordinator.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CurrencyListViewController.getInstance()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func currencyDetail(currency: Currency) {
        let vc = CurrencyDetailViewController.getInstance()        
        vc.coordinator = self
        vc.currency = currency
        
       // vc.transitioningDelegate = vc
        vc.modalPresentationStyle = .popover
//        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.present(vc, animated: true) {
            
        }
    }
    
}
