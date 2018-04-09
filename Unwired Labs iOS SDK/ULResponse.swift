//
//  ULResponse.swift
//  Unwired Labs iOS SDK
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//


import Foundation

public class ULResponse: NSObject {
    public var status: String = ""
    public var balance: Int?
    public var message: String = ""
    public var locations :[ULLocationObject] = []
    
    func setupWithData(dictionary :NSDictionary, type: String) {
        if (type == "forward") {
            if let array :NSArray = dictionary.object(forKey: "address") as? NSArray {
                for object in array {
                    let dict = object as! NSDictionary
                    let location = ULLocationObject()
                    location.setupWithData(dictionary: dict)
                    locations.append(location)
                }
            }
        } else if (type == "reverse") {
            if let object :NSObject = dictionary.object(forKey: "address") as? NSObject {
                    let dict = object as! NSDictionary
                    let location = ULLocationObject()
                    location.setupWithData(dictionary: dict)
                    locations.append(location)
            }
        }
        
        if let status :String = dictionary.object(forKey: "status") as? String {
            self.status = status
        }
        
        if let balance :Int = dictionary.object(forKey: "balance") as? Int {
            self.balance = balance
        }
        
        if let message :String = dictionary.object(forKey: "message") as? String {
            self.message = message
        }
        
        
    }

}
