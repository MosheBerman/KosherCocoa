//
//  DynamicNOAACalculatorTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 12/31/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import XCTest
import Foundation
import KosherCocoa

class DynamicNOAACalculatorTestCase : DynamicTestCase {
    static var timeZone: TimeZone = {
        TimeZone(identifier: "America/New_York")!
    }()
    static var lakewood: GeoLocation = {
        GeoLocation(
            latitude: 40.096,
            andLongitude: -74.222,
            elevation: 25.58,
            andTimeZone: timeZone
        )
    }()

    static var calendar: AstronomicalCalendar = {
        let calculator = NOAACalculator(geoLocation: lakewood)
        let astroCalendar = AstronomicalCalendar(location: lakewood)
        astroCalendar.astronomicalCalculator = calculator
        return astroCalendar
    }()


    /// A reusable date formatter.
    private static var dateFormatter: DateFormatter = {

        let formatter = DateFormatter()

        formatter.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
        formatter.timeZone = DynamicNOAACalculatorTestCase.timeZone

        return formatter
    }()

    private static var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()

        formatter.setLocalizedDateFormatFromTemplate("hh:mm:ssa")
        formatter.timeZone = DynamicNOAACalculatorTestCase.timeZone

        return formatter
    }()

    /// A class method which returns dynamic tests as a dictionary.
    /// The keys are the test names and the values are blocks to execute them.
    /// - Returns: A dictionary of tests to invoke.
    override class func dynamicTests() -> [String : @convention(block) () -> Void]? {

        let gregorian: Calendar = .init(identifier: .gregorian)
        var output: [String : @convention(block) () -> Void] = [:]

        /// Load the tests from a CSV file.
        guard let tests: [[String]] = try? TestsFromCSV.loadTests(from: "SunriseSunsetLakewoodNOAA") else {
            XCTFail("Could not read tests from CSV.")
            return [:]
        }

        /// This is the CSV headers, also the selectors to test.
        guard let methodsToTest: [String] = tests.first else {
            XCTFail("CSV was empty.")
            return [:]
        }

        /// Iterate the test cases, skipping the headers row.
        for testIdx in stride(from: 1, through: tests.count, by: 9) {
            let testCase = tests[testIdx]
            /// The first field is the date.
            guard let inputDateAsString: String = testCase.first else {
                XCTFail("Missing date in test case: \(testCase)")
                continue
            }

            /// Iterate each method for the given date.
            for (methodIdx, methodName) in (methodsToTest[1...]).enumerated() {

                let dateFormattedForTest: String = inputDateAsString
                    .replacingOccurrences(of: ",", with: "")
                    .replacingOccurrences(of: " ", with: "_")

                let selectorName: String = "test_\(methodName)_\(dateFormattedForTest)"

                output[selectorName] = {
                    guard let workingDate = DynamicNOAACalculatorTestCase.dateFormatter.date(from: inputDateAsString) else {
                        XCTFail("Could not parse input date string. (Got \(inputDateAsString)).")
                        return
                    }

                    calendar.workingDate = workingDate

                    let selector = Selector(methodName)
                    guard let performedSelector = calendar.perform(selector) else {
                        XCTFail("Failed to call calendar.perform(Selector())")
                        return
                    }

                    guard let result: Date = performedSelector.takeUnretainedValue() as? Date else {
                        XCTFail("Result wasn't a date.")
                        return
                    }


                    /// As of iOS 17, the `DateFormatter` uses a different unicode value to
                    /// represent a space in time strings than it did before. This causes strings
                    /// created from dates to have this unexpected "narrow non-breaking-space"
                    /// instead of the character produced by using the space bar on your keyboard.
                    ///
                    /// To work around this, we simply strip out all whitespace from both the test
                    /// result and the expected result. This simplifies comparing time strings that
                    /// have the form "<hour>:<minute>:<second><space><am or pm>".
                    ///
                    /// Further reading:
                    /// https://developer.apple.com/forums/thread/731850
                    /// https://stackoverflow.com/questions/31272561/31483262#31483262
                    guard let expectedTime = DynamicNOAACalculatorTestCase.timeFormatter.date(from:testCase[methodIdx+1]) else {
                        XCTFail("Failed to parse date.")
                        return
                    }

                    /// Set the expected time on the input date - so we can compare the times on
                    /// the expected date.
                    let expectedComponents = gregorian.dateComponents([.hour, .minute, .second], from: expectedTime)
                    guard let expected = gregorian.date(
                        bySettingHour: expectedComponents.hour!,
                        minute: expectedComponents.minute!,
                        second: expectedComponents.second!,
                        of: workingDate
                    ) else {
                        XCTFail("Failed to construct expected result date.")
                        return
                    }
                    /// Compare the resulting points in time, allowing for a 1 second discrepancy.
                    XCTAssertEqual(
                        result.timeIntervalSinceReferenceDate,
                        expected.timeIntervalSinceReferenceDate,
                        accuracy: 1
                    )
                }
            }
        }

        return output
    }
}
