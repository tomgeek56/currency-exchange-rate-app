//
//  CurrencyDetailTableViewCell.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 03/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyDetailTableViewCell: ReusableCell {
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelBaseCurrency: UILabel!
    @IBOutlet weak var labelSecondCurrency: UILabel!
    
    func configure(_ model: CurrencyDetailResult) {
        
        labelDate.text = model.date
        labelBaseCurrency.text = "\(model.baseCurrency.getStringRepresentation())"
        labelSecondCurrency.text = "\(model.secondCurrency.getStringRepresentation())"
    }
    
}
