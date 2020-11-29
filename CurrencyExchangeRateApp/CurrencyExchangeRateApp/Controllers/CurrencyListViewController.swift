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
    var refreshControl: UIRefreshControl = UIRefreshControl()
    var dataSource = TableDataSource<Currency, CurrencyTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    func loadUI() {
        currencyListViewModel.errorHandler = { (message) in
            self.showErrorAlert(message)
        }
        
        currencyListViewModel.currencies.addObserver { (currencies) in
            self.dataSource.setData(data: currencies)
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
        
        currencyListViewModel.fetchData()

        self.title = R.string.localizable.app_title()
        self.refreshControl.addTarget(currencyListViewModel, action: #selector(currencyListViewModel.pullToRefreshAction), for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
        self.tableView.setDataSourceAndDelegate(delegate: dataSource)
        self.tableView.initView(CurrencyTableViewCell.self)
        self.tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        dataSource.userDidTapCellAtIndex = { indexPath in
            self.coordinator?.currencyDetail(currency: self.dataSource[indexPath.row])
        }
        dataSource.animated = true
    }
}

