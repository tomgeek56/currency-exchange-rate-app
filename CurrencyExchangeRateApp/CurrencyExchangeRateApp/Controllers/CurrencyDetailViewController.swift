//
//  CurrencyDetailViewController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 02/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: BaseViewController {

    var currency: Currency?
    var currencyDetailViewModel: CurrencyDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyDetailViewModel = CurrencyDetailViewModel(self.currency)
        currencyDetailViewModel?.fetchData()
    }
    
}
