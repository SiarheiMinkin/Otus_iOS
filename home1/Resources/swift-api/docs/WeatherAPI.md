# WeatherAPI

All URIs are relative to *https://api.openweathermap.org/data/2.5*

Method | HTTP request | Description
------------- | ------------- | -------------
[**everythingGet**](WeatherAPI.md#everythingget) | **GET** /weather/ | Call current weather data for one location


# **everythingGet**
```swift
    open class func everythingGet(lat: Double, lon: Double, lang: String, appid: String, completion: @escaping (_ data: CityWeather?, _ error: Error?) -> Void)
```

Call current weather data for one location

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let lat = 987 // Double | city latitude
let lon = 987 // Double | city longtitude
let lang = "lang_example" // String | language code
let appid = "appid_example" // String | api key

// Call current weather data for one location
WeatherAPI.everythingGet(lat: lat, lon: lon, lang: lang, appid: appid) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lat** | **Double** | city latitude | 
 **lon** | **Double** | city longtitude | 
 **lang** | **String** | language code | 
 **appid** | **String** | api key | 

### Return type

[**CityWeather**](CityWeather.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

