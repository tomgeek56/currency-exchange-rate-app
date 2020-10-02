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
    
    static func instantiate() -> Self? {
          // this pulls out "MyApp.MyViewController"
          let fullName = NSStringFromClass(self)

          // this splits by the dot and uses everything after, giving "MyViewController"
          let className = fullName.components(separatedBy: ".")[1]

          // load our storyboard
          let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

          // instantiate a view controller with that identifier, and force cast as the type that was requested
          return storyboard.instantiateViewController(withIdentifier: className) as? Self
      }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
