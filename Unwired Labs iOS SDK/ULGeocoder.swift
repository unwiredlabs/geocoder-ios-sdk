//
//  File.swift
//  Unwired Labs iOS SDK
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//

import Foundation


/// Unwired Labs iOS Geocoder Library public interface
public class ULGeocoder: NSObject {
    var apiKey : String = ""
    
    /// Convenience Initialiser
    ///
    /// - Parameter apiKey: Your API key as provided by Unwired Labs. If you dont have a key, sign up for free at https://unwiredlabs.com/trial
    @objc public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// A function that provides a iOS wrapper for the Unwired Labs Reverse Geocoding API.
    ///
    /// - Parameters:
    ///   - latitude: An NSNumber. The latitude of the location. This is required
    ///   - longitude: An NSNumber. The longitude of the location. This is required
    ///   - completionBlock: A block which returns the response from the API. This is required.
    @objc public func reverseGeocode(latitude :NSNumber, longitude :NSNumber, completionBlock :@escaping ReverseGeocoderCompletionBlock) {
        ULRequest.sharedInstance.reverseGeocode(latitude: latitude, longitude: longitude, apiKey: apiKey, completionBlock: completionBlock)
    }
  
    /// A function that provides a iOS wrapper for the Unwired Labs Forward Geocoding API.
    ///
    /// - Parameters:
    ///   - address: A String. The address of the location. This is required
    ///   - withAnnotations: A Bool sent as to whether you want annotations returned as well. This is required
    ///   - completionBlock: A block which returns the response from the API. This is required.
    @objc public func forwardGeocode(address :String, completionBlock :@escaping ForwardGeocoderCompletionBlock) {
        ULRequest.sharedInstance.forwardGeocode(address: address, apiKey: apiKey, completionBlock: completionBlock)
    }
    
}
