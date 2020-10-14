//
//  Animator.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 14/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import UIKit

typealias Animation = (UITableViewCell, IndexPath) -> Void

class Animator {
    private var animatedIndexes: Set<Int> = []
    private let animation: Animation?
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, indexPath: IndexPath) {
        guard let animation = animation else {
            return
        }
        
        if animatedIndexes.contains(indexPath.row) {
            return
        }
        
        animatedIndexes.insert(indexPath.row)
        
        animation(cell, indexPath)
    }
}
