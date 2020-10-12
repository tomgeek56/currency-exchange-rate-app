//
//  TableDataSource.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 12/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import UIKit

class TableDataSource <T: Any, C: ReusableCell> : NSObject, UITableViewDelegate, UITableViewDataSource {
        var data: [T] = []
        var userDidTapCellAtIndex: ((IndexPath) -> Void)?
        
        func setData(data: [T]) {
            self.data = data
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell =  tableView.dequeueReusableCell(withIdentifier: C.identifier, for: indexPath) as? C else {
                return UITableViewCell()
            }
            cell.bind(model: data[indexPath.row])
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            userDidTapCellAtIndex?(indexPath)
        }
    
}
