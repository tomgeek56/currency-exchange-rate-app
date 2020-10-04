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
    
    // swiftlint:disable force_cast
    static func getInstance() -> Self {
        let storyboardName = String(describing: self).replacingOccurrences(of: "ViewController", with: "")
        guard let controller =  UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? BaseViewController else {
            return BaseViewController() as! Self
        }
        
        return controller as! Self
    }
    // swiftlint:disable:previous force_cast
    
    func showErrorAlert(_ message: String) {
        let controller = UIAlertController(title: "An error occured", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: {(_) in
            controller.dismiss(animated: true, completion: nil)
        }
        ))
        self.present(controller, animated: true, completion: nil)
    }
    
}
