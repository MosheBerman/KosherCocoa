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
        
        let metadata = KCZman.metadata()
        var missingEntries : [(String, String)] = []
        
        for (selectorString, calculationMetadata) in metadata
        {
            for (key, metadataEntry) in calculationMetadata
            {
                let nonEmptyMetadataField = metadataEntry.characters.count > 0
                
                if nonEmptyMetadataField == false
                {
                    let pair = (selectorString, key)
                    missingEntries.append(pair)
                }
            }
        }
        
        XCTAssert(missingEntries.count == 0, "There are some entries missing values: \(missingEntries)")
    }
    
    /** Iterate and check for strings containing the word "method" or a pair of parenthesis'()' */
    func testForMethodNames()
    {
        let metadata = KCZman.metadata()
        
        let flaggableContent = ["()", "method", "Method"]
        
        for offender in flaggableContent
        {
            print("Testing disallowed string: '\(offender)'")
            
            for (selectorName, value) in metadata
            {
                if let explainer = value["koshercocoa.explanation.english"]
                {
                    let testableExplainer = explainer
                    
                    XCTAssertFalse(testableExplainer.contains(offender), "Explanation for '\(selectorName)' contains a variant of '\(offender)'")
                }
            }
        }
    }
    
    /** Iterate groups and check for strings that appear more than once */
    func testForDuplicateMethodNamesInGroupings()
    {
        let originalMappings = KCZman.relatedZmanimMapping()
        
        var mapping : [String: Int] = [:]
        
        // We could use reduce here...
        for group in originalMappings
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
    
    /** Iterate groups of methods and check for missing metadata entries. */
    func testForMissingMetadataEntry()
    {
        let flattenedMethodGroups = KCZman.relatedZmanimMapping().flatMap { $0 }
        let metadataKeys = KCZman.metadata().keys
        
        for selectorName in flattenedMethodGroups
        {
            XCTAssert(metadataKeys.contains(selectorName), "\(selectorName) is missing metadata.")
        }
        
    }
    
    /** Iterate metadata and check for groups that aren't represented in the selectors grouping. */
    func testForExtraMetadata()
    {
        let flattenedMethodGroups = KCZman.relatedZmanimMapping().flatMap { $0 }
        let metadataKeys = KCZman.metadata().keys
        
        for metadataGroup in metadataKeys
        {
            XCTAssert(flattenedMethodGroups.contains(metadataGroup), "\(metadataGroup) isn't listed in the grouping array.")
        }
    }
}

