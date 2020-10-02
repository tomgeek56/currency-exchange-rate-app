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
        currencyListViewModel.currencies.addObserver { (_) in
            self.tableView.reloadData()
        }
        
        loadUI()
    }
    
    func loadUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.tableHeaderView = UIView(frame: CGRect.zero)
        self.tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
        self.tableView.registerNibAndReuseIdentifierForCell(cell: CurrencyTableViewCell.self)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }
}

extension CurrencyListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyListViewModel.currencies.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(currencyListViewModel.currencies.value[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.currencyDetail(currency: currencyListViewModel.currencies.value[indexPath.row])
    }
    
}
