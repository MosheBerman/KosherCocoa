/**
 *  KCNOAACalculatorTests
 *  KosherCocoa 3
 *
 *  Created by Elyahu on 2/5/23.
 *  Updated by Moshe Berman on 12/29/23.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

import XCTest
import KosherCocoa

final class KCNOAACalculatorTests: XCTestCase {
    static var timeZone: TimeZone = {
        TimeZone(identifier: "America/New_York")!
    }()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let lakewood: GeoLocation = GeoLocation(
        latitude: 40.096,
        andLongitude: -74.222,
        elevation: 25.58,
        andTimeZone: timeZone
    )
    lazy var lakewoodCalculator:NOAACalculator = {
        NOAACalculator(geoLocation: lakewood)
    }()

    lazy var calendar: AstronomicalCalendar = {
        AstronomicalCalendar(location: lakewoodCalculator.geoLocation)
    }()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testCalculatorNames() throws {
        XCTAssertEqual(lakewoodCalculator.calculatorName, "US National Oceanic and Atmospheric Administration Algorithm")
    }
    
    func testCalculatesSunriseOnJanuaryFirstAsExpected() throws {
        var januaryFirst = DateComponents(timeZone: KCNOAACalculatorTests.timeZone)
        januaryFirst.year = 2023
        januaryFirst.month = 1
        januaryFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: januaryFirst)!
        var sunrise = calendar.sunrise()

        januaryFirst.hour = 7
        januaryFirst.minute = 18
        januaryFirst.second = 03

        XCTAssertEqual(
            sunrise!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: januaryFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }

    func testCalculatesSunriseOnMayFirstAsExpected() throws {
        var mayFirst = DateComponents(timeZone: KCNOAACalculatorTests.timeZone)
        mayFirst.year = 2023
        mayFirst.month = 5
        mayFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: mayFirst)!
        var sunrise = calendar.sunrise()

        mayFirst.hour = 5
        mayFirst.minute = 56
        mayFirst.second = 6

        XCTAssertEqual(
            sunrise!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: mayFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }
    func testCalculatesSunriseOnAugustFirstAsExpected() throws {
        var augustFirst = DateComponents()
        augustFirst.year = 2023
        augustFirst.month = 8
        augustFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: augustFirst)!
        var sunrise = calendar.sunrise()

        augustFirst.hour = 5
        augustFirst.minute = 53
        augustFirst.second = 56

        XCTAssertEqual(
            sunrise!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: augustFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )

    }

    func testCalculatesSunriseOnDecemberFirstAsExpected() throws {
        var decFirst = DateComponents()
        decFirst.year = 2023
        decFirst.month = 12
        decFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: decFirst)!
        var sunrise = calendar.sunrise()

        decFirst.hour = 6
        decFirst.minute = 58
        decFirst.second = 36

        XCTAssertEqual(
            sunrise!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: decFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }
    
    func testCalculatesSunsetOnJanuaryFirstAsExpected() throws {

        var januaryFirst = DateComponents()
        januaryFirst.year = 2023
        januaryFirst.month = 1
        januaryFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: januaryFirst)!
        var sunset = calendar.sunset()

        januaryFirst.hour = 16
        januaryFirst.minute = 42
        januaryFirst.second = 56

        XCTAssertEqual(
            sunset!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: januaryFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }

    func testCalculatesSunsetOnMayFirstAsExpected() throws {
        var mayFirst = DateComponents()
        mayFirst.year = 2023
        mayFirst.month = 5
        mayFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: mayFirst)!
        var sunset = calendar.sunset()

        mayFirst.hour = 19
        mayFirst.minute = 52
        mayFirst.second = 33

        XCTAssertEqual(
            sunset!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: mayFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }

    func testCalculatesSunsetOnAugustFirstAsExpected() throws {
        var augustFirst = DateComponents()
        augustFirst.year = 2023
        augustFirst.month = 8
        augustFirst.day = 1

        calendar.workingDate = gregorianCalendar.date(from: augustFirst)!
        var sunset = calendar.sunset()

        augustFirst.hour = 20
        augustFirst.minute = 11
        augustFirst.second = 58

        XCTAssertEqual(
            sunset!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: augustFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )

    }

    func testCalculatesSunsetOnDecemberFirstAsExpected() throws {
        var decFirst = DateComponents()
        decFirst.year = 2023
        decFirst.month = 12
        decFirst.day = 1
        
        calendar.workingDate = gregorianCalendar.date(from: decFirst)!
        var sunset = calendar.sunset()
        
        decFirst.hour = 16
        decFirst.minute = 32
        decFirst.second = 55

        XCTAssertEqual(
            sunset!.timeIntervalSinceReferenceDate,
            gregorianCalendar.date(from: decFirst)!.timeIntervalSinceReferenceDate,
            accuracy: 1
        )
    }
}
