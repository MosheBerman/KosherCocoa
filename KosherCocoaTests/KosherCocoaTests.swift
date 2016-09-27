//
//  KosherCocoaTests.swift
//  KosherCocoaTests
//
//  Created by Moshe Berman on 9/25/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

import XCTest
@testable import KosherCocoa

class KosherCocoaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - KCZMan Tests
    
    func testForMetadataWithMissingEntries()
    {
        // Iterate and check all fields for zero length strings
    }
    
    func testForMethodNames()
    {
        // Iterate and check for stringcs containing the word "method" or a pair of parenthesis'()'
    }
    
    func testForDuplicates()
    {
        // Iterate groups and check for strings that appear more than once
        
        let originalMetadata = KCZman.relatedZmanimMapping()
        
        var mapping : [String: Int] = [:]
        
        // We could use reduce here...
        for group in originalMetadata
        {
            for zman in group
            {
                if let count = mapping[zman]
                {
                    mapping[zman] = count + 1
                }
                else
                {
                    mapping[zman] = 1
                }
            }
        }
        
        
        for tuple in mapping
        {
            XCTAssert(tuple.value == 1, "\(tuple.key) was \(tuple.value). Expected 1.")
        }
        
    }
    
    func testForMissingMetadataEntry()
    {
        // Iterate groups of methods and check for missing metadata entries
    }
    
    func testForExtraMetadata()
    {
        // Iterate metadata and check for groups that aren't represented in the selectors grouping.
    }
}

