//
//  KCParityTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 10/7/26.
//  Copyright © 2026 Moshe Berman. All rights reserved.
//

import XCTest
import KosherCocoa

/// Golden parity net against the canonical KosherJava test suite.
///
/// Golden values live in Golden/ZmanimGolden.json (extracted from the
/// KosherJava test sources by scripts/extract_golden.py). Java getter names
/// are translated to Obj-C selectors through the Golden/Mapping-*.json
/// fragments; cases with no mapping entry are counted and printed as
/// SKIPPED so later PRs can add fragments without touching this runner.
///
/// Tolerance: instants and durations must agree within 120 seconds. That
/// window absorbs known drift between the two codebases rather than real
/// behavioral differences:
///   - KosherCocoa uses a fixed 16' solar radius while canonical KosherJava
///     uses a date-based apparent-solar-radius table;
///   - double-precision math differences between the Java and Obj-C ports.
/// A delta larger than 120s is a genuine parity break, not noise.
final class KCParityTests: XCTestCase {

    private static let tolerance: TimeInterval = 120.0

    private struct Fixture: Decodable {
        let name: String
        let lat: Double
        let lon: Double
        let elev: Double
        let tz: String
    }

    private struct GoldenCase: Decodable {
        let method: String
        let calendar: String
        let fixture: String
        let date: String
        let kind: String
        let expected: String?
    }

    private struct GoldenFile: Decodable {
        let fixtures: [String: Fixture]
        let cases: [GoldenCase]
    }

    private func loadGolden() throws -> (fixtures: [String: Fixture], cases: [GoldenCase], mapping: [String: String]) {
        let bundle = Bundle(for: KCParityTests.self)
        guard let goldenURL = bundle.url(forResource: "ZmanimGolden", withExtension: "json", subdirectory: "Golden") else {
            throw NSError(domain: "KCParityTests", code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "ZmanimGolden.json not found in test bundle Golden/ subdirectory"])
        }
        let golden = try JSONDecoder().decode(GoldenFile.self, from: Data(contentsOf: goldenURL))

        var mapping: [String: String] = [:]
        let mappingURLs = bundle.urls(forResourcesWithExtension: "json", subdirectory: "Golden") ?? []
        for url in mappingURLs where url.lastPathComponent.hasPrefix("Mapping-") {
            let fragment = try JSONDecoder().decode([String: String].self, from: Data(contentsOf: url))
            for (key, value) in fragment {
                mapping[key] = value
            }
        }
        return (golden.fixtures, golden.cases, mapping)
    }

    private func calendarFor(fixture: Fixture, date: String) -> ComplexZmanimCalendar {
        let timeZone = TimeZone(identifier: fixture.tz)!
        let geoLocation = GeoLocation(latitude: fixture.lat,
                                      andLongitude: fixture.lon,
                                      elevation: fixture.elev,
                                      andTimeZone: timeZone)
        let calendar = ComplexZmanimCalendar(location: geoLocation)
        // Noon in the fixture timezone avoids DST-boundary ambiguity.
        var dateCalendar = Calendar(identifier: .gregorian)
        dateCalendar.timeZone = timeZone
        let parts = date.split(separator: "-").compactMap { Int($0) }
        var components = DateComponents()
        components.year = parts[0]
        components.month = parts[1]
        components.day = parts[2]
        components.hour = 12
        calendar.workingDate = dateCalendar.date(from: components)!
        return calendar
    }

    private static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()

    private static let durationPattern = try! NSRegularExpression(
        pattern: #"^PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(?:\.\d+)?)S)?$"#)

    private func seconds(fromDuration iso: String) -> Double? {
        let range = NSRange(iso.startIndex..<iso.endIndex, in: iso)
        guard let match = Self.durationPattern.firstMatch(in: iso, range: range) else { return nil }
        func group(_ i: Int) -> Double {
            guard let r = Range(match.range(at: i), in: iso) else { return 0 }
            return Double(iso[r]) ?? 0
        }
        return group(1) * 3600 + group(2) * 60 + group(3)
    }

    func testGoldenParity() throws {
        let (fixtures, cases, mapping) = try loadGolden()

        var calendars: [String: ComplexZmanimCalendar] = [:]
        func calendar(for goldenCase: GoldenCase) -> ComplexZmanimCalendar {
            let key = "\(goldenCase.fixture)|\(goldenCase.date)"
            if let existing = calendars[key] { return existing }
            let built = calendarFor(fixture: fixtures[goldenCase.fixture]!, date: goldenCase.date)
            calendars[key] = built
            return built
        }

        var passed = 0
        var skipped: Set<String> = []
        var maxDelta: Double = 0

        for goldenCase in cases {
            guard let selector = mapping[goldenCase.method] else {
                skipped.insert(goldenCase.method)
                continue
            }
            // KVC invokes the no-arg Obj-C getter: NSDate stays an object,
            // double/long returns arrive boxed as NSNumber, nil stays nil.
            let raw = calendar(for: goldenCase).value(forKey: selector)
            let label = "\(goldenCase.method) [\(goldenCase.fixture) \(goldenCase.date)]"

            switch goldenCase.kind {
            case "instant":
                guard let actual = raw as? Date,
                      let expectedString = goldenCase.expected,
                      let expected = Self.isoFormatter.date(from: expectedString) else {
                    XCTFail("\(label): expected instant \(goldenCase.expected ?? "nil"), got \(String(describing: raw))")
                    continue
                }
                let delta = abs(actual.timeIntervalSince1970 - expected.timeIntervalSince1970)
                maxDelta = max(maxDelta, delta)
                XCTAssertLessThanOrEqual(delta, Self.tolerance, "\(label): delta \(delta)s exceeds tolerance")
                passed += 1

            case "duration":
                guard let actual = (raw as? NSNumber)?.doubleValue,
                      let expectedString = goldenCase.expected,
                      let expected = seconds(fromDuration: expectedString) else {
                    XCTFail("\(label): expected duration \(goldenCase.expected ?? "nil"), got \(String(describing: raw))")
                    continue
                }
                let delta = abs(actual - expected)
                maxDelta = max(maxDelta, delta)
                XCTAssertLessThanOrEqual(delta, Self.tolerance, "\(label): delta \(delta)s exceeds tolerance")
                passed += 1

            case "null":
                XCTAssertNil(raw, "\(label): expected nil, got \(String(describing: raw))")
                passed += 1

            case "nonNull":
                XCTAssertNotNil(raw, "\(label): expected non-nil")
                passed += 1

            default:
                XCTFail("\(label): unknown golden kind \(goldenCase.kind)")
            }
        }

        for method in skipped.sorted() {
            print("SKIPPED (no selector mapping yet): \(method)")
        }
        print(String(format: "Parity: %d passed, %d skipped, max delta %.3fs",
                     passed, skipped.count, maxDelta))
    }

    /// Pins the calculator name strings as they exist today. A later micro-PR
    /// renames the USNO calculator; this records the pre-rename behavior.
    func testCalculatorNamePins() throws {
        let noaa = NOAACalculator(geoLocation: GeoLocation())
        XCTAssertEqual(noaa.calculatorName,
                       "US National Oceanic and Atmospheric Administration Algorithm")

        let usno = SunriseAndSunsetCalculator(geoLocation: GeoLocation())
        XCTAssertEqual(usno.calculatorName,
                       "US Naval Almanac Algorithm")
    }
}
