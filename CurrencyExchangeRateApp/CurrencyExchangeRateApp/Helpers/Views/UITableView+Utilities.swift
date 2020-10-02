//
//  UITableView+Utilities.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNibAndReuseIdentifierForCell<T: ReusableCell>(cell: T.Type) {
       
        self.register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
}
