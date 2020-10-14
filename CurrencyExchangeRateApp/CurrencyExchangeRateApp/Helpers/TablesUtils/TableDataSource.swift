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
    
    var animated: Bool? {
        didSet {
            if animated ?? false {
                self.animator = Animator(animation: AnimationCellFactory.makeAnimation())
            }
        }
    }
    
    var data: [T] = []
    var userDidTapCellAtIndex: ((IndexPath) -> Void)?
    var animator: Animator?
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let animator = self.animator else {
            return
        }
        
        animator.animate(cell: cell, indexPath: indexPath)
    }
}

extension TableDataSource {
    subscript(index: Int) -> T {
        get {
            self.data[index]
        }
        set(newValue) {
            self.data[index] = newValue
        }
    }
}
