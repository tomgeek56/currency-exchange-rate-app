//
//  CurrencyListViewModelTests.swift
//  CurrencyExchangeRateAppTests
//
//  Created by GeeksDeck on 04/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import XCTest
@testable import CurrencyExchangeRateApp

class CurrencyListViewModelTests: XCTestCase {
    
    var viewModel: CurrencyListViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = CurrencyListViewModel()
    }
    
    func testFetchCurrencies() {
        let expectation = XCTestExpectation(description: "Fetch Curremcies should return at least 1 Currency")
        
        self.viewModel.errorHandler = { (msg) in
            XCTAssert(false, "Fetch currencies shoudn't sends error")
        }
        
        self.viewModel.currencies.addObserver { (currencies) in
            if currencies.count > 0 {
                expectation.fulfill()
            }
        }
        
        self.viewModel.fetchData()
        
        wait(for: [expectation], timeout: 4.0)
    }
    
}
