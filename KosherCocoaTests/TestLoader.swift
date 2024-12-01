//
//  TestLoader.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 12/29/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import Foundation

/// Loads tests from CSV files.
@objc class TestsFromCSV: NSObject {
    /// Splits the file into a multidimensional array.
    /// - Parameter file: The name of a CSV file in the test bundle.
    /// - Returns: A multidimensional array of test cases.
    ///
    /// The first row contains the names of the methods to be tested.
    /// Each of the following rows represents a test case.
    /// - The first item is the Gregorian date.
    /// - Each of the following values is the expected output for the method named in that column header.
    @objc public class func loadTests(from file:String) throws -> [[String]] {
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
                let range = NSString(string: $0).range(of: ",")
                return NSString(string: $0)
                    .replacingOccurrences(of: ",", with: "<comma>", range: range)
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
}
