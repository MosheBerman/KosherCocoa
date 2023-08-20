//
//  KCPerformanceTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 8/20/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import XCTest
@testable import KosherCocoa

final class KCPerformanceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWallclockTimeToGetAlos() throws {
        // This is an example of a performance test case.
        self.measure {
            let geoLocation = GeoLocation(latitude: 40.096, andLongitude: -74.222, elevation: 29.02, andTimeZone: TimeZone(identifier: "America/New_York")!)
            let zmanimCalendar = ZmanimCalendar(location: geoLocation)
            _ = zmanimCalendar.alos72()
        }
    }

}
