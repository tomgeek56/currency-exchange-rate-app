//
//  BaseViewController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    static func getInstance() -> BaseViewController {
        let storyboardName = String(describing: self).replacingOccurrences(of: "ViewController", with: "")
        guard let controller =  UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? BaseViewController else {
            return BaseViewController()
        }
        
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
