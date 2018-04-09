//
//  ULConstants.swift
//  Unwired Labs iOS SDK
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//


import Foundation

public struct ULConstants {
    /// Constants for the base url and available endpoints to make requests.
    public struct URL {
        /// Schemen for request
        public static let scheme = "https"
        /// Default base url for Pelias requests.
        public static let baseUrl = "unwiredlabs.com"
        /// Pelias version.
        public static let baseVersion = "/v2/"
        /// Reverse geo endpoing.
        public static let reverse = "\(baseVersion)reverse.php"
        /// Search endpoint.
        public static let search = "\(baseVersion)search.php"
    }
    
    /// Constants for various base parameters for endpoints to make requests.
    public struct Params {
        /// User by all endpoints for api key
        public static let key = "token"
        /// Used by reverse endpoint for latitude
        public static let latitude = "lat"
        /// Used by reverse endpoint for longitude
        public static let longitude = "lon"
        /// User by search endpoint for query
        public static let query = "q"
    }
}
