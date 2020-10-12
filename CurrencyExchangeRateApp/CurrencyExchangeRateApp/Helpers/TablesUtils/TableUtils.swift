//
//  TableUtils.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 12/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func setDataSourceAndDelegate<T>(delegate: T) where T: UITableViewDataSource, T: UITableViewDelegate {
        self.delegate = delegate
        self.dataSource = delegate
    }
    
    func initView(_ cell: ReusableCell.Type) {
          self.tableFooterView = UIView(frame: CGRect.zero)
          self.tableHeaderView = UIView(frame: CGRect.zero)
        self.registerNibAndReuseIdentifierForCell(cell: cell)
          self.rowHeight = UITableView.automaticDimension
          self.estimatedRowHeight = 44
          
    }
}
