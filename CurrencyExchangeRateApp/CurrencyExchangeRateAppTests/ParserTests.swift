//
//  ParserTests.swift
//  CurrencyExchangeRateAppTests
//
//  Created by GeeksDeck on 04/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import XCTest
@testable import CurrencyExchangeRateApp

class ParserTests: XCTestCase {
    
    var listData: Data?
    var detailData: Data?
    
    override func setUp() {
        super.setUp()
        self.listData = FileManager.readFileContent(for: "currencyListSample", fileExtension: "json")
    }
    
    func testListParser() {
        let currencyList: CurrencyList? = Service.parse(listData)
        guard let _ = currencyList else {
            XCTAssert(false, "Currency List error parser")
            return
        }
        
        if currencyList?.base != "EUR" {
            XCTAssert(false, "Currency List base currency is EUR")
        }
        
        if currencyList?.rates.count != 32 {
            XCTAssert(false, "Currency List shoud be 32")
        }
        
        if currencyList?.getCurrencies().count != 32 {
            XCTAssert(false, "Currency List shoud be 32")
        }
        
    }
}
