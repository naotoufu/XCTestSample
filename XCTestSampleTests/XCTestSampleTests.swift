//
//  XCTestSampleTests.swift
//  XCTestSampleTests
//
//  Created by 伊東直人 on 2017/05/25.
//  Copyright © 2017 伊東直人. All rights reserved.
//

import XCTest
@testable import XCTestSample

class XCTestSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowWeather() {
        class VCMock:ViewController {
            override func getWeather(_ closure:(String) -> Void) {
                closure("test weather")
            }
        }
        
        let vcm:VCMock = VCMock()
        vcm.showWeather()
    }

    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
