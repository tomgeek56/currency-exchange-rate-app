//
//  DateUtilsTests.swift
//  CurrencyExchangeRateAppTests
//
//  Created by GeeksDeck on 04/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import XCTest
@testable import CurrencyExchangeRateApp

class DateUtilsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testNmberOfDaysFromPrevMonday() {
        let date1 = Date.dateFormatter.date(from: "2020-10-10")
        let date2 = Date.dateFormatter.date(from: "2020-10-08")
        let date3 = Date.dateFormatter.date(from: "2021-01-01")
        let date4 = Date.dateFormatter.date(from: "2020-11-29")
        
        let daysForDay1 = date1?.getDatesFromPreviousMonday()
        let daysForDay2 = date2?.getDatesFromPreviousMonday()
        let daysForDay3 = date3?.getDatesFromPreviousMonday()
        let daysForDay4 = date4?.getDatesFromPreviousMonday()
        
        XCTAssertEqual(daysForDay1, 13)
        XCTAssertEqual(daysForDay2, 11)
        XCTAssertEqual(daysForDay3, 12)
        XCTAssertEqual(daysForDay4, 14)
    }
}
