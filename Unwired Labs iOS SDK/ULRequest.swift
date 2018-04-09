//
//  ULRequest.swift
//  Unwired Labs iOS SDK
//
//  Copyright © 2018 Unwired Labs (India) Pvt. Ltd. All rights reserved.
//

import Foundation

typealias AsyncCompletionBlock  = (_ resultDictionary: NSDictionary, _ success: Bool, _ error: NSError?) -> ()
public typealias ReverseGeocoderCompletionBlock  = (_ addressArray :ULResponse, _ success: Bool, _ error: NSError?) -> ()
public typealias ForwardGeocoderCompletionBlock  = (_ locationArray :ULResponse, _ success: Bool, _ error: NSError?) -> ()

class ULRequest: NSObject {
    static let sharedInstance = ULRequest() 
    
    func reverseGeocode(latitude :NSNumber, longitude :NSNumber, apiKey :String, completionBlock :@escaping ReverseGeocoderCompletionBlock) {
        var url = URLComponents()
        url.scheme = ULConstants.URL.scheme
        url.host = ULConstants.URL.baseUrl
        url.path = ULConstants.URL.reverse
        url.queryItems = [
            URLQueryItem(name: ULConstants.Params.key, value: apiKey),
            URLQueryItem(name: ULConstants.Params.latitude, value: String(describing: latitude as NSNumber)),
            URLQueryItem(name: ULConstants.Params.longitude, value: String(describing: longitude as NSNumber)),
        ]
        downloadDataFromURL(url.url!) { (dict, success, error) in
            let response :ULResponse = ULResponse()
            var error :NSError? = error
            var hasSucceeded = success
            
            if success {
                response.setupWithData(dictionary: dict, type: "reverse")
        
                if( response.status != "ok"){
                    hasSucceeded = false
                    error = NSError(domain: response.message, code: 200, userInfo: nil)
                }
            }
            
            completionBlock(response, hasSucceeded, error)
        }
    }
    
    func forwardGeocode(address :String, apiKey :String, completionBlock :@escaping ForwardGeocoderCompletionBlock) {
        var url = URLComponents()
        url.scheme = ULConstants.URL.scheme
        url.host = ULConstants.URL.baseUrl
        url.path = ULConstants.URL.search
        url.queryItems = [
            URLQueryItem(name: ULConstants.Params.key, value: apiKey),
            URLQueryItem(name: ULConstants.Params.query, value: address)
        ]
        downloadDataFromURL(url.url!) { (dict, success, error) in
            let response :ULResponse = ULResponse()
            var error :NSError? = error
            var hasSucceeded = success
            
            if success {
                response.setupWithData(dictionary: dict, type: "forward")
                if( response.status != "ok"){
                    hasSucceeded = false
                    error = NSError(domain: response.message, code: 200, userInfo: nil)
                }
            }
            
            completionBlock(response, hasSucceeded, error)
        }
    }
    
    
    func downloadDataFromURL(_ url: URL, completionBlock:@escaping AsyncCompletionBlock) {
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        self.downloadDataFromRequest(request as URLRequest, completionBlock: completionBlock)
    }
    
    func downloadDataFromRequest(_ request: URLRequest, completionBlock:@escaping AsyncCompletionBlock) {
        let sessionConfig :URLSessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response, error == nil else {
                completionBlock(NSDictionary(), false, error as NSError?)
                return
            }
            
            var dict :NSDictionary?
            
            do {
                dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
            } catch _ as NSError {
                
            }
            
            let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if dict == nil {
                dict = NSDictionary(object: string!, forKey: "data" as NSCopying)
            }
            
            var success = true
            var error :NSError?
            if dict!.object(forKey: "error") != nil {
                success = false
                if let string :String = dict!.object(forKey: "error") as? String {
                    error = NSError(domain: string, code: 0, userInfo: [:])
                }
                else  {
                    error = NSError(domain: "Somethings gone wrong", code: 0, userInfo: [:])
                }
            }
            
            completionBlock(dict!, success, error)
        })
        
        task.resume()
    }
    
    func escapeCharacters(_ string :String) -> String {
        let customAllowedSet =  CharacterSet(charactersIn:"\"#%/<>?@\\^`{|}+, ").inverted
        let escapedString = string.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        
        return escapedString! as String
    }

}
