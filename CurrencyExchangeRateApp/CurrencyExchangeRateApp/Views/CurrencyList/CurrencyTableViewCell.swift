//
//  CurrencyTableViewCell.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: ReusableCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func configure(_ model: Currency) {
        self.labelTitle.text = model.name
        self.labelSubtitle.text = "\(model.value.getCurrencyRepresentation(for: model.name))"
    }
    
}
