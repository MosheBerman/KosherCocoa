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
    
    // MARK: - Metadata Contents
    
    /** Iterate and check all fields for zero length strings */
    func testForMetadataWithMissingEntries()
    {
        let metadata = KCZman.metadata()
        
        for (selectorString, calculationMetadata) in metadata
        {
            for (key, metadataEntry) in calculationMetadata
            {
                let nonEmpty = metadataEntry.characters.count > 0
                
                XCTAssert(nonEmpty, "\(selectorString) is missing \(key)")
            }
        }
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
                    
                    XCTAssertFalse(testableExplainer.contains(offender), "Explanation for '\(selectorName)' contains '\(offender)'")
                }
            }
        }
    }
    
    /** Test for placeholders */
    func testForPlaceholders()
    {
        
        let metadata = KCZman.metadata()
        
        let flaggableContent = ["<# #>", "<#explanation#>"]
        
        for offender in flaggableContent
        {
            print("Testing disallowed string: '\(offender)'")
            
            for (selectorName, value) in metadata
            {
                if let explainer = value["koshercocoa.explanation.english"]
                {
                    let testableExplainer = explainer
                    
                    XCTAssertFalse(testableExplainer.contains(offender), "Explanation for '\(selectorName)' contains '\(offender)'")
                }
            }
        }
        
    }
    
    
    // MARK: - Duplicates
    
    /** Iterate groups and check for strings that appear more than once */
    func testForDuplicateMethodNamesInGroupings()
    {
        let originalMappings = KCZman.relatedZmanimMapping()
        
        var count : [String: Int] = [:]
        
        // We could use reduce here...
        for group in originalMappings
        {
            for zman in group
            {
                if let countForZman = count[zman]
                {
                    count[zman] = countForZman + 1
                }
                else
                {
                    count[zman] = 1
                }
            }
        }
        
        for tuple in count
        {
            XCTAssert(tuple.value == 1, "\(tuple.key) was \(tuple.value). Expected 1.")
        }
        
    }
    
    /** Iterate metadata keys and check for selector names that appear more than once. */
    func testForDuplicateDescriptionNamesInMetadata()
    {
        let metadata = KCZman.metadata()
        
        var count : [String: Int] = [:]
        
        for selectorGroup in metadata
        {
            guard let selectorName = selectorGroup.value["koshercocoa.name.hebrew"] else
            {
                continue
            }
            
            guard selectorName.characters.count > 0 else
            {
                continue
            }
            
            if let countForSelector = count[selectorName]
            {
                count[selectorName] = countForSelector + 1
            }
            else
            {
                count[selectorName] = 1
            }
        }
        
        for tuple in count
        {
            XCTAssert(tuple.value == 1, "\(tuple.key) was \(tuple.value). Expected 1.")
        }
    }
    
    /** Detect double spaces in descriptions */
    func testDuplicateSpaceCharactersInDescriptions()
    {
        let metadata = KCZman.metadata()
        
        let characters = "abcdefghijklmnopqrstuvwxyz.,)+*1234567890"
        
        for entry in metadata
        {
            for field in entry.value
            {
                if field.value.characters.count == 0
                {
                    continue
                }
                
                for character in characters.characters
                {
                    let valueToTest = field.value
                    let duplicateSpacing = "\(character)  "
                    let containsDuplicateSpaces = valueToTest.contains(duplicateSpacing)
                    
                    XCTAssertFalse(containsDuplicateSpaces, "Extra spaces after a character: '\(character)' in \(entry).")
                }
            }
        }
    }
    
    // MARK: - Count Mismatches Between Grouping and Metadata
    
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

