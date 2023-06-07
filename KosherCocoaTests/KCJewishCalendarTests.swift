//
//  KCJewishCalendarTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 11/22/17.
//  Copyright © 2017 Moshe Berman. All rights reserved.
//

import XCTest
import KosherCocoa

class KCJewishCalendarTests: XCTestCase {
    
    let hebrewCalendar = Calendar(identifier: .hebrew)
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let dateFormatter = DateFormatter()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.dateFormatter.dateStyle = .medium
        self.dateFormatter.timeStyle = .none
        self.dateFormatter.timeZone = TimeZone.current
        self.dateFormatter.calendar = hebrewCalendar
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHolidays() {
        let jewishCalendar = JewishCalendar()
        
        var lagComponents = DateComponents()
        lagComponents.year = 5778
        lagComponents.month = Int(HebrewMonth.iyar.rawValue)
        lagComponents.day = 17//day is off because of adjustment with sunset, should be 18
        
        jewishCalendar.workingDate = hebrewCalendar.date(from: lagComponents)!
        
        var holiday = jewishCalendar.yomTovIndex()
        
        XCTAssertEqual(holiday, 33)
        
        var spkComponents = DateComponents()//Shushan Purim Katan test
        spkComponents.year = 5776//leap year
        spkComponents.month = Int(HebrewMonth.adar.rawValue)
        spkComponents.day = 14//day is off because of adjustment with sunset, should be 15
        
        jewishCalendar.workingDate = hebrewCalendar.date(from: spkComponents)!
        
        holiday = jewishCalendar.yomTovIndex()
        
        XCTAssertEqual(holiday, 34)
    }
    
    // MARK: - Test Basic Calculation of Chanuka
    
    func testFirstNightOfChanuka() {
        
        let jewishCalendar = JewishCalendar()

        var kislevComponents = DateComponents()
        kislevComponents.year = 5778
        kislevComponents.month = Int(HebrewMonth.kislev.rawValue)
        kislevComponents.day = 25
        
        guard let firstNightOfChanuka = hebrewCalendar.date(from: kislevComponents) else {
            XCTAssert(false, "Couldn't create date representing first night of Chanuka, 5778.")
            return
        }
        
        jewishCalendar.workingDate = firstNightOfChanuka
        
        let nightOfChanuka = jewishCalendar.dayOfChanukah()
        
        XCTAssertEqual(nightOfChanuka, 1)
    }
    
    // MARK: - Test Over 19 Year Cycle
    
    func testFirstNightOfChanukaOver19Years() {
        
        let jewishCalendar = JewishCalendar()
        
        let startYear = 5778
        let endYear = startYear + 19
        
        for year in startYear...endYear {
            var kislevComponents = DateComponents()
            kislevComponents.year = year
            kislevComponents.month = Int(HebrewMonth.kislev.rawValue)
            kislevComponents.day = 25
            
            guard let firstNightOfChanuka = hebrewCalendar.date(from: kislevComponents) else {
                XCTAssert(false, "Couldn't create date representing first night of Chanuka, 5778.")
                return
            }
            
            jewishCalendar.workingDate = firstNightOfChanuka
            
            let nightOfChanuka = jewishCalendar.dayOfChanukah()
            
            XCTAssertEqual(nightOfChanuka, 1)
        }
    }

    // MARK: - Test All Night Across 19 Years
    
    func testAllNightsOfChanuka() {
        
        let jewishCalendar = JewishCalendar()
        
        var kislev5778Components = DateComponents()
        kislev5778Components.year = 5778
        kislev5778Components.month = Int(HebrewMonth.kislev.rawValue)
        kislev5778Components.day = 25
        
        guard let firstNightOfChanuka = hebrewCalendar.date(from: kislev5778Components) else {
            XCTAssert(false, "Couldn't create date representing first night of Chanuka, 5778.")
            return
        }
        
        for offset in 0..<8 {
            var daysComponent = DateComponents()
            daysComponent.day = offset
            
            guard let nthNight = hebrewCalendar.date(byAdding: daysComponent, to: firstNightOfChanuka, wrappingComponents: false) else {
                XCTAssert(false, "Couldn't create date representing nth of Chanuka, 5778. n = \(offset)")
                return
            }
            
            jewishCalendar.workingDate = nthNight
            
            let nightOfChanuka = jewishCalendar.dayOfChanukah()
            let expectedNight = offset + 1
            let dateString = dateFormatter.string(from: nthNight)
            
            XCTAssertEqual(nightOfChanuka, expectedNight, "\(offset): Expected night to be \(expectedNight) on \(dateString). It was \(nightOfChanuka).")
        }
        
    }
    
    
    // MARK: - Test All Night Across 19 Years
    
    func testAllNightsOfChanukaAcross19Years() {
        
        let jewishCalendar = JewishCalendar()
        
        let startYear = 5778
        let endYear = startYear + 19
        
        for year in startYear...endYear {
            var kislev5778Components = DateComponents()
            kislev5778Components.year = year
            kislev5778Components.month = Int(HebrewMonth.kislev.rawValue)
            kislev5778Components.day = 25
            
            guard let firstNightOfChanuka = hebrewCalendar.date(from: kislev5778Components) else {
                XCTAssert(false, "Couldn't create date representing first night of Chanuka, 5778.")
                return
            }
            
            for offset in 0..<8 {
                var daysComponent = DateComponents()
                daysComponent.day = offset
                
                guard let nthNight = hebrewCalendar.date(byAdding: daysComponent, to: firstNightOfChanuka, wrappingComponents: false) else {
                    XCTAssert(false, "Couldn't create date representing nth of Chanuka, 5778. n = \(offset)")
                    return
                }
                
                jewishCalendar.workingDate = nthNight
                
                let nightOfChanuka = jewishCalendar.dayOfChanukah()
                let expectedNight = offset + 1
                let dateString = dateFormatter.string(from: nthNight)
                
                XCTAssertEqual(nightOfChanuka, expectedNight, "\(offset): Expected night to be \(expectedNight) on \(dateString). It was \(nightOfChanuka).")
            }
        
        }
    }
    
    // MARK: - Test Erev Chanuka Before Sunset
    
    func testFirstNightByGregorianDateBeforeSunset() {
        
        var dec12th2017Components = DateComponents()
        dec12th2017Components.year = 2017
        dec12th2017Components.day = 12
        dec12th2017Components.month = 12
        dec12th2017Components.hour = 10
        dec12th2017Components.minute = 0
        
        guard let gregorianDateBeforeChanuka = gregorianCalendar.date(from: dec12th2017Components) else {
            XCTAssert(false, "Couldn't create date representing Dec 12, 2017, before sunset.")
            return
        }
        
        guard let timeZone = TimeZone(abbreviation: "EST") else {
            XCTAssert(false, "Couldn't get time zone for EST by abbreviation.")
            return
        }
        
        // We need to set this up, since we aren't mocking sunset.
        let geoLocation = GeoLocation(latitude: 40.7128 , andLongitude: -74.0060, andTimeZone: timeZone)
        let jewishCalendar = JewishCalendar(location: geoLocation)
        jewishCalendar.workingDate = gregorianDateBeforeChanuka
        
        // First test that before sunset (the initial 12/12/17 date object) is not Night 1-8
        XCTAssertFalse(jewishCalendar.isChanukah())
    }
    
    
    func testFirstNightByGregorianDateAfterSunset() {
        
        var dec12th2017Components = DateComponents()
        dec12th2017Components.year = 2017
        dec12th2017Components.day = 12
        dec12th2017Components.month = 12
        
        guard let gregorianDateBeforeChanuka = gregorianCalendar.date(from: dec12th2017Components) else {
            XCTAssert(false, "Couldn't create date representing Dec 12, 2017, before sunset.")
            return
        }
        
        guard let timeZone = TimeZone(abbreviation: "EST") else {
            XCTAssert(false, "Couldn't get time zone for EST by abbreviation.")
            return
        }
        
        // We need to set this up, since we aren't mocking sunset.
        let geoLocation = GeoLocation(latitude: 40.7128 , andLongitude: -74.0060, andTimeZone: timeZone)
        let jewishCalendar = JewishCalendar(location: geoLocation)
        jewishCalendar.workingDate = gregorianDateBeforeChanuka
        
        guard let sunset = jewishCalendar.sunset() else {
            XCTAssert(false, "Couldn't create date representing Dec 12, 2017 at sunset.")
            return
        }
        
        guard let afterSunset = gregorianCalendar.date(byAdding: .second, value: 2, to: sunset) else {
            XCTAssert(false, "Couldn't create date representing Dec 12, 2017 a second past sunset.")
            return
        }
        
        jewishCalendar.workingDate = afterSunset
        
        self.dateFormatter.calendar = gregorianCalendar
        self.dateFormatter.timeStyle = .medium
        
        let before = "Before: \(dateFormatter.string(from: gregorianDateBeforeChanuka))"
        let sunsetString = "Sunset: \(dateFormatter.string(from: sunset))"
        let afterSunsetString = "After Sunset: \(dateFormatter.string(from: afterSunset))"
        
        // First test that before sunset (the initial 12/12/17 date object) is not Night 1-8
        XCTAssertTrue(jewishCalendar.isChanukah(), "\(before) \(sunsetString) \(afterSunsetString)")
    }
    
    
}
