//
//  GitHubAPITests.swift
//  GitHubAPITests
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import XCTest
@testable import GitHubAPI

class ExtensionsTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIntegerExtension() {
        let tenDot   = 10.formatted(withSeparator: ".")
        let tenComma = 10.formatted(withSeparator: ",")
        let tenSpace = 10.formatted(withSeparator: " ")
        XCTAssertEqual(tenDot,   "10")
        XCTAssertEqual(tenComma, "10")
        XCTAssertEqual(tenSpace, "10")
        
        let tenThousandDot   = 10000.formatted(withSeparator: ".")
        let tenThousandComma = 10000.formatted(withSeparator: ",")
        let tenThousandSpace = 10000.formatted(withSeparator: " ")
        XCTAssertEqual(tenThousandDot,   "10.000")
        XCTAssertEqual(tenThousandComma, "10,000")
        XCTAssertEqual(tenThousandSpace, "10 000")
        
        let tenMillionDot   = 1000000.formatted(withSeparator: ".")
        let tenMillionComma = 1000000.formatted(withSeparator: ",")
        let tenMillionSpace = 1000000.formatted(withSeparator: " ")
        XCTAssertEqual(tenMillionDot,   "1.000.000")
        XCTAssertEqual(tenMillionComma, "1,000,000")
        XCTAssertEqual(tenMillionSpace, "1 000 000")
    }
    
}
