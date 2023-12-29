//
//  KCAstronomicalCalculatorTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 12/29/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import XCTest
import KosherCocoa

final class KCAstronomicalCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalculatorNames() throws {
        let calculator = SunriseAndSunsetCalculator(geoLocation: GeoLocation())
        XCTAssertEqual(calculator.calculatorName, "United States Naval Almanac Algorithm")
    }

}
