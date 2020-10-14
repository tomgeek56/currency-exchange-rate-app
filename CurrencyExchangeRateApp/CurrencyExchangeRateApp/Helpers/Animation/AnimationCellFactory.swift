//
//  AnimationCellFactory.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 14/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import UIKit

struct AnimationCellFactory {
        
    static func makeAnimation() -> Animation {
         return { cell, indexPath in
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height / 2)
            cell.alpha = 0

            UIView.animate(
                withDuration: 0.5,
                delay: 0.03 * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
}
