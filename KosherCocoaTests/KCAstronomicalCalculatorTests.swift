//
//  KCAstronomicalCalculatorTests.swift
//  KosherCocoaTests
//
//  Created by Elyahu on 2/5/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import XCTest
import KosherCocoa

final class KCAstronomicalCalculatorTests: XCTestCase {
    
    let gregorianCalendar = Calendar(identifier: .gregorian)

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testCalculatorNames() throws {
        let calculator = NOAACalculator(geoLocation: GeoLocation())
        XCTAssertEqual(calculator.calculatorName, "US National Oceanic and Atmospheric Administration Algorithm")
        
        let SunriseAndSunsetCalculator = SunriseAndSunsetCalculator(geoLocation: GeoLocation())
        XCTAssertEqual(SunriseAndSunsetCalculator.calculatorName, "United States Naval Almanac Algorithm")
    }
    
    func testCalculatorSunrise() throws {
        let lakewoodCalculator = NOAACalculator(geoLocation: GeoLocation(latitude: 40.08213, andLongitude: -74.20970, andTimeZone: TimeZone(identifier: "America/New_York")!))
        
        var januaryFirst = DateComponents()
        januaryFirst.year = 2023
        januaryFirst.month = 1
        januaryFirst.day = 1
        
        let calendar = AstronomicalCalendar(location: lakewoodCalculator.geoLocation)
        calendar.astronomicalCalculator = lakewoodCalculator
        calendar.workingDate = gregorianCalendar.date(from: januaryFirst)!
        var sunrise = calendar.sunrise()
        
        januaryFirst.hour = 7
        januaryFirst.minute = 18
        januaryFirst.second = 57
        
        XCTAssertEqual(sunrise, gregorianCalendar.date(from: januaryFirst))
        
        var mayFirst = DateComponents()
        mayFirst.year = 2023
        mayFirst.month = 5
        mayFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: mayFirst)!
        sunrise = calendar.sunrise()
        
        mayFirst.hour = 5
        mayFirst.minute = 56
        mayFirst.second = 59
        
        XCTAssertEqual(sunrise, gregorianCalendar.date(from: mayFirst))
        
        var augustFirst = DateComponents()
        augustFirst.year = 2023
        augustFirst.month = 8
        augustFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: augustFirst)!
        sunrise = calendar.sunrise()
        
        augustFirst.hour = 5
        augustFirst.minute = 54
        augustFirst.second = 51
        
        XCTAssertEqual(sunrise, gregorianCalendar.date(from: augustFirst))
        
        var decFirst = DateComponents()
        decFirst.year = 2023
        decFirst.month = 12
        decFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: decFirst)!
        sunrise = calendar.sunrise()
        
        decFirst.hour = 6
        decFirst.minute = 59
        decFirst.second = 29
        
        XCTAssertEqual(sunrise, gregorianCalendar.date(from: decFirst))
    }
    
    func testCalculatorSunset() throws {
        let lakewoodCalculator = NOAACalculator(geoLocation: GeoLocation(latitude: 40.08213, andLongitude: -74.20970, andTimeZone: TimeZone(identifier: "America/New_York")!))
        
        var januaryFirst = DateComponents()
        januaryFirst.year = 2023
        januaryFirst.month = 1
        januaryFirst.day = 1
        
        let calendar = AstronomicalCalendar(location: lakewoodCalculator.geoLocation)
        calendar.astronomicalCalculator = lakewoodCalculator
        calendar.workingDate = gregorianCalendar.date(from: januaryFirst)!
        var sunset = calendar.sunset()
        
        januaryFirst.hour = 16
        januaryFirst.minute = 41
        januaryFirst.second = 56
        
        XCTAssertEqual(sunset, gregorianCalendar.date(from: januaryFirst))
        
        var mayFirst = DateComponents()
        mayFirst.year = 2023
        mayFirst.month = 5
        mayFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: mayFirst)!
        sunset = calendar.sunset()
        
        mayFirst.hour = 19
        mayFirst.minute = 51
        mayFirst.second = 33
        
        XCTAssertEqual(sunset, gregorianCalendar.date(from: mayFirst))
        
        var augustFirst = DateComponents()
        augustFirst.year = 2023
        augustFirst.month = 8
        augustFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: augustFirst)!
        sunset = calendar.sunset()
        
        augustFirst.hour = 20
        augustFirst.minute = 10
        augustFirst.second = 56
        
        XCTAssertEqual(sunset, gregorianCalendar.date(from: augustFirst))
        
        var decFirst = DateComponents()
        decFirst.year = 2023
        decFirst.month = 12
        decFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: decFirst)!
        sunset = calendar.sunset()
        
        decFirst.hour = 16
        decFirst.minute = 31
        decFirst.second = 56
        
        XCTAssertEqual(sunset, gregorianCalendar.date(from: decFirst))
    }
}
