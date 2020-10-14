//
//  CurrencyTableViewCell.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: ReusableCell {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiCustomization()
    
    }
    
    private func uiCustomization() {
        self.viewContent.layer.cornerRadius = Theme.SIZES.CORNER_RADUIS
        self.accessoryType = .none
        self.contentView.backgroundColor = UIColor.clear
        self.viewContent.layer.shadowColor = Theme.Colors.SHADOW_COLOR.cgColor
        self.viewContent.layer.shadowOpacity = 0.5
        self.viewContent.layer.shadowOffset = .zero
        self.viewContent.layer.shadowRadius = 3
        self.viewContent.layer.borderWidth = 1
        self.viewContent.layer.borderColor = Theme.Colors.SHADOW_COLOR.cgColor
    }
    
    private func configure(_ model: Currency) {
        self.labelTitle.text = model.name
        self.labelSubtitle.text = "\(model.value.getCurrencyRepresentation(for: model.name))"
    }
    
    override func bind(model: Any) {
        if let model = model as? Currency {
            self.configure(model)
        }
    }
    
}
