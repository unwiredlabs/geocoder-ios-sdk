# Unwired Labs Geocoding SDK for iOS #

This is the Geocoding SDK for iOS by Unwired Labs to use Unwired Labs geocoding service on iOS at ease.

## Requirements ##

`Unwired Labs Geocoding SDK` works on iOS 10+ and requires ARC to build. It uses the `Foundation.framework`  by Apple

You will need an API key from Unwired Labs to initialise this SDK. [Sign up for a free Developer token] (http://unwiredlabs.com/trial)

## Adding Unwired Labs Geocoding SDK to your project ##


### By including source files ###

You can directly add the source files to your project, they are found under 'Unwired Labs iOS SDK'.

* Download the latest code version or add the repository as a git submodule to your git-tracked project.
* Open your project in Xcode, then drag and drop the classes onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.

### By importing the project ###
You can also import Unwired Labs Geocoding SDK project as a static library to your project or workspace.

* Download the latest code version or add the repository as a git submodule to your git-tracked project.
* Open your project in Xcode, then drag and drop 'Unwired Labs Geocoding SDK.xcodeproj' onto your project or workspace (use the "Product Navigator view").
* Select your target and go to the Build phases tab. In the Link Binary With Libraries section select the add button. On the sheet find and add `UnwiredLabsGeocodingSDK.framework`. You might also need to add `UnwiredLabsGeocodingSDK` to the Target Dependencies list.

## Usage ##

Unwired Labs Geocoding SDK is built on top of NSURLSession with a completionBlock. All requests happens asynchronously.

First to initialise the SDK there is a convenience initialiser.

``` let geocoder :ULGeocoder = ULGeocoder.init(apiKey: "YOUR-API-KEY") ```

To use Reverse Geocoding, pass latitude and longitude as NSNumber as given below. The response from the server is parsed into objects as listed further down in this readme.

```
gecoder.reverseGeocode(latitude: 17.4206485, longitude: 78.4008997) { (response, success, error) in
    if success {
		//Use response to get individual elements
    } else {
       //Failed requests
       print(response.message)
    }
}

```

To use Forward Geocoding, pass a query string to the method as given below. The response from the server is parsed into objects as listed further down in this readme.

```
gecoder.forwardGeocode(address: "Empire state building") { (response, success, error) in
	if success {
        //Use response to get individual elements
    } else {
        //Failed requests
        print(response.message)
    }
}

```
### To get individual elements ###

Use ` response.locations[0].<component>` , where component can be any member as follows:


  Component     | Description
  ------------- | -----------
  display_name  | Matched Address name for the given location
  house_number  | House Number
  road          | Road Name
  neighbourhood | Neighbourhood
  suburb        | Suburb
  city          | City name (normalized form of *city*, *town*, *village*, *hamlet*)
  county        | County name (normalized form of *county*, *state_district*)
  country       | Country name
  country_code  | Country code
  postcode      | Postal code

The API only returns components that have valid values for a location. Component town is normalized to city to make things simple. Do check for `nil` before using any component
