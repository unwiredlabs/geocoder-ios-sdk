//
//  ULLocation.swift
//  Unwired Labs iOS SDK
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//


import Foundation

public class ULLocationObject: NSObject {
    public var house_number: String = ""
    public var road: String = ""
    public var neighbourhood: String = ""
    public var suburb: String = ""
    public var city: String = ""
    public var state: String = ""
    public var county: String = ""
    public var postcode: String = ""
    public var country: String = ""
    public var country_code: String = ""
    public var display_name: String = ""
    public var latitude: String = ""
    public var longitude: String = ""
    
    func setupWithData(dictionary :NSDictionary) {
        if let house_number :String = dictionary.object(forKey: "house_number") as? String {
            self.house_number = house_number
        }
        
        if let road :String = dictionary.object(forKey: "road") as? String {
            self.road = road
        }
        
        if let neighbourhood :String = dictionary.object(forKey: "neighbourhood") as? String {
            self.neighbourhood = neighbourhood
        }
        
        if let suburb :String = dictionary.object(forKey: "suburb") as? String {
            self.suburb = suburb
        }
        
        if let city :String = dictionary.object(forKey: "city") as? String {
            self.city = city
        }
        
        if let state :String = dictionary.object(forKey: "state") as? String {
            self.state = state
        }
        
        if let county :String = dictionary.object(forKey: "county") as? String {
            self.county = county
        }
        
        if let postcode :String = dictionary.object(forKey: "postcode") as? String {
            self.postcode = postcode
        }
        
        if let country :String = dictionary.object(forKey: "country") as? String {
            self.country = country
        }
        
        if let country_code :String = dictionary.object(forKey: "country_code") as? String {
            self.country_code = country_code
        }
        
        if let display_name :String = dictionary.object(forKey: "display_name") as? String {
            self.display_name = display_name
        }
        
        if let latitude :String = dictionary.object(forKey: "lat") as? String {
            self.latitude = latitude
        }
        
        if let longitude :String = dictionary.object(forKey: "lon") as? String {
            self.longitude = longitude
        }
    }
}
