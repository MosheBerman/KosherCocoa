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

    let gregorianCalendar = Calendar(identifier: .gregorian)
    let lakewood: GeoLocation = GeoLocation(
        latitude: 40.08213,
        andLongitude: -74.20970,
        andTimeZone: TimeZone(identifier: "America/New_York")!
    )
    lazy var lakewoodCalculator:NOAACalculator = {
        NOAACalculator(geoLocation: lakewood)
    }()

    lazy var calendar: AstronomicalCalendar = {
        AstronomicalCalendar(location: lakewoodCalculator.geoLocation)
    }()



    /// Splits the file into a multidimensional array.
    /// - Parameter file: The name of a CSV file in the test bundle.
    /// - Returns: A multidimensional array of test cases.
    ///
    /// The first row contains the names of the methods to be tested.
    /// Each of the following rows represents a test case.
    /// - The first item is the Gregorian date.
    /// - Each of the following values is the expected output for the method named in that column header.
    @available(iOS 16.0, *)
    private class func testCases(from file:String) throws -> [[String]] {
        guard let url = Bundle(for: self).url(forResource: file, withExtension: "csv")
        else {
            return []
        }

        let rawTestCases = try String(contentsOf: url, encoding: .utf8)
        let lines: [String] = rawTestCases.components(separatedBy:.newlines).filter{ !$0.isEmpty }
        let commaCharacterSet: CharacterSet = CharacterSet(charactersIn: ",")

        let headers: [[String]] = [lines[0]
            .components(separatedBy:commaCharacterSet)
            .compactMap {$0.trimmingCharacters(in: .whitespacesAndNewlines)}
        ]
        let testCases: [[String]] = lines[1...]
            .compactMap {
                $0
                    .replacing(",", with: "<comma>", maxReplacements: 1)
                    .components(separatedBy:commaCharacterSet)
                    .compactMap {
                        NSString(string: $0)
                            .replacingOccurrences(of:"<comma>", with: String(","))
                            .replacingOccurrences(of: "\"", with: "")
                            .trimmingCharacters(in: .whitespacesAndNewlines)
                    }
            }
        return headers + testCases
    }


    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testCalculatorNames() throws {
        XCTAssertEqual(lakewoodCalculator.calculatorName, "US National Oceanic and Atmospheric Administration Algorithm")
    }
    
    func testCalculatorSunrise() throws {
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
