//
//  ULRequestTests.swift
//  Unwired Labs iOS SDKTests
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//

import XCTest

class ULRequestTests: XCTestCase {
    
    static let apiKey = "YOUR_API_KEY"
    var requestGeocoder = ULGeocoder.init(apiKey: apiKey)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForwardRequestEmptyQuery() {
        print ("Make sure to replace the API key on the top")
        let sucessfulExpectation = expectation(description: "Empty query status check")
        requestGeocoder.forwardGeocode(address: "") { (response, success, error) in
            if success {
                //Successful payload response
            } else {
                XCTAssert(response.status == "error")
                sucessfulExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testForwardRequestSuccessfulQuery() {
        let sucessfulExpectation = expectation(description: "Successful query status check")
        requestGeocoder.forwardGeocode(address: "Empire state building") { (response, success, error) in
            if success {
                //Successful payload response
                XCTAssert(response.status == "ok")
                sucessfulExpectation.fulfill()
            } else {
                print("Let us troubleshoot here")
                print(response.message)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testForwardRequestSuccessfulQueryResults() {
        let sucessfulExpectation = expectation(description: "Successful query results check")
        requestGeocoder.forwardGeocode(address: "Empire state building") { (response, success, error) in
            if success {
                //Successful payload response
                XCTAssert(response.status == "ok")
                
                XCTAssert(response.locations[0].house_number == "350")
                XCTAssert(response.locations[0].road == "5th Avenue")
                XCTAssert(response.locations[0].city == "New York City")
                XCTAssert(response.locations[0].county == "New York County")
                XCTAssert(response.locations[0].state == "New York")
                XCTAssert(response.locations[0].postcode == "10018")
                XCTAssert(response.locations[0].country == "United States of America")
                XCTAssert(response.locations[0].country_code == "us")
                XCTAssert(response.locations[0].display_name == "Empire State Building, 350, 5th Avenue, Korea Town, Manhattan Community Board 5, New York County, New York City, New York, 10018, United States of America")
                XCTAssert(response.locations[0].latitude == "40.7484284")
                XCTAssert(response.locations[0].longitude == "-73.9856546198733")
                
                XCTAssert(response.locations[1].house_number == "350")
                XCTAssert(response.locations[1].road == "5th Avenue")
                XCTAssert(response.locations[1].city == "New York City")
                XCTAssert(response.locations[1].county == "New York County")
                XCTAssert(response.locations[1].state == "New York")
                XCTAssert(response.locations[1].postcode == "10118")
                XCTAssert(response.locations[1].country == "United States of America")
                XCTAssert(response.locations[1].country_code == "us")
                XCTAssert(response.locations[1].display_name == "Empire State Building, 350, 5th Avenue, Korea Town, Manhattan Community Board 5, New York County, New York City, New York, 10118, United States of America")
                XCTAssert(response.locations[1].latitude == "40.7481628")
                XCTAssert(response.locations[1].longitude == "-73.9849958")
                
                sucessfulExpectation.fulfill()
            } else {
                
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testForwardRequestSuccessfulNoMatchQuery() {
        let sucessfulExpectation = expectation(description: "Successful No match query status check")
        requestGeocoder.forwardGeocode(address: "Batman forever") { (response, success, error) in
            if success {
                //Successful payload response
            } else {
                XCTAssert(response.status == "error")
                XCTAssert(response.message == "NO_MATCHES")
                sucessfulExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testBalanceOnForwardRequest() {
        let sucessfulExpectation = expectation(description: "Get Balance on Forward request check")
        requestGeocoder.forwardGeocode(address: "Empire State Building") { (response, success, error) in
            if success {
                //Successful payload response
                XCTAssert(response.status == "ok")
                XCTAssert(response.balance! == Int(response.balance!))
                sucessfulExpectation.fulfill()
            } else {
                
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func testReverseRequestEmptyQuery() {
        let sucessfulExpectation = expectation(description: "Empty query error status check")
        requestGeocoder.reverseGeocode(latitude: 0, longitude: 0) { (response, success, error) in
            if success {
                //Successful payload response
            } else {
                XCTAssert(response.status == "error")
                sucessfulExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testReverseRequestSuccessfulQuery() {
        let sucessfulExpectation = expectation(description: "Reverse query successful status check")
        requestGeocoder.reverseGeocode(latitude: 17.4206485, longitude: 78.4008997) { (response, success, error) in
            if success {
                //Successful payload response
                XCTAssert(response.status == "ok")
                XCTAssert(response.locations[0].house_number == "123")
                XCTAssert(response.locations[0].road == "Road No 22")
                XCTAssert(response.locations[0].neighbourhood == "Prashasan Nagar")
                XCTAssert(response.locations[0].suburb == "Jubilee Hills")
                XCTAssert(response.locations[0].city == "Greater Hyderabad Municipal Corporation")
                XCTAssert(response.locations[0].county == "Rangareddy District")
                XCTAssert(response.locations[0].state == "Telangana")
                XCTAssert(response.locations[0].postcode == "500081")
                XCTAssert(response.locations[0].country == "India")
                XCTAssert(response.locations[0].country_code == "in")
                XCTAssert(response.locations[0].display_name == "123, Road No 22, Prashasan Nagar, Jubilee Hills, Greater Hyderabad Municipal Corporation Central Zone, Greater Hyderabad Municipal Corporation, Rangareddy District, Telangana, 500081, India")
                sucessfulExpectation.fulfill()
            } else {
                
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testBalanceOnReverseRequestQuery() {
        let sucessfulExpectation = expectation(description: "Get Balance on Reverse request check")
        requestGeocoder.reverseGeocode(latitude: 17.4206485, longitude: 78.4008997) { (response, success, error) in
            if success {
                //Successful payload response
                XCTAssert(response.status == "ok")
                XCTAssert(response.balance! == Int(response.balance!))
                sucessfulExpectation.fulfill()
            } else {
                
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
