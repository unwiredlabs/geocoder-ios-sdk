//
//  Unwired_Labs_iOS_SDKTests.swift
//  Unwired Labs iOS SDKTests
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//


import XCTest
@testable import UnwiredLabsGeocodingSDK

class Unwired_Labs_iOS_SDKTests: XCTestCase {
    
    var apiKey: String = "YOUR_API_KEY"
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSDKInit() {
        print ("Make sure to replace the API key on the top")
        let geocoder = ULGeocoder.init(apiKey: apiKey)
        XCTAssert(geocoder.apiKey == apiKey)
    }
    
    func testSuccessfulAPIResponseForward() {
        let requestGeocoder = ULGeocoder.init(apiKey: apiKey)
        let successExpectation = expectation(description: "Successful response for Forward Geocoding")
        requestGeocoder.forwardGeocode(address: "Empire state building") { (response, success, error) in
            if success {
                //Successful payload response
                successExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func testSuccessfulAPIResponseReverse() {
        let requestGeocoder = ULGeocoder.init(apiKey: apiKey)
        let successExpectation = expectation(description: "Successful response for Reverse Geocoding")
        requestGeocoder.reverseGeocode(latitude: 17.4206485, longitude: 78.4008997) { (response, success, error) in
            if success {
                //Successful payload response
                successExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
