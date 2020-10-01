//
//  CurrencyListViewController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 01/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import UIKit

class CurrencyListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var currencyListViewModel = CurrencyListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyListViewModel.fetchData()
    }
}
