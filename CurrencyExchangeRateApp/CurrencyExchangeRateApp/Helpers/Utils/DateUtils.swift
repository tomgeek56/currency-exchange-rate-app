//
//  DateUtils.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 03/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

extension Date {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Config.API_DATE_FORMAT
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()
    
    static var calendar: Calendar = {
        return Calendar(identifier: .gregorian)
    }()
    
    func getDayOfWeekStartingFromSunday() -> Int {
        return Date.calendar.component(.weekday, from: self)
    }
    
    func getDateBySubstractingDays(numberOfDays: Int) -> Date? {
        return Date.calendar.date(byAdding: DateComponents(day: numberOfDays * -1), to: self)
    }
    
    func getDateBySubstractingWeeks(numberOfWeeks: Int) -> Date? {
        return Date.calendar.date(byAdding: DateComponents(weekday: numberOfWeeks * -1), to: self)
    }
    
    func getDatesFromPreviousMonday() -> Int {
        let daysInWeek = 7
        let sundayOffset = 6
        let dayOfWeek = self.getDayOfWeekStartingFromSunday()
        
        //For sunday we have to add extra 7 because dayOfWeek starts from Sunday
        if dayOfWeek != 1 {
            return dayOfWeek + sundayOffset
        }
        
        return dayOfWeek + daysInWeek + sundayOffset
    }
    
}

extension String {
    func getDate() -> Date? {
        return Date.dateFormatter.date(from: self)
    }
}
