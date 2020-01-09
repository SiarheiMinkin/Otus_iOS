//
// WeatherAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class WeatherAPI {
    /**
     Call current weather data for one location
     
     - parameter lat: (query) city latitude 
     - parameter lon: (query) city longtitude 
     - parameter lang: (query) language code 
     - parameter appid: (query) api key 
     - parameter units: (query) units (metric/imperial(default)) (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func everythingGet(lat: Double, lon: Double, lang: String, appid: String, units: String? = nil, completion: @escaping ((_ data: CityWeather?,_ error: Error?) -> Void)) {
        everythingGetWithRequestBuilder(lat: lat, lon: lon, lang: lang, appid: appid, units: units).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Call current weather data for one location
     - GET /weather/
     - parameter lat: (query) city latitude 
     - parameter lon: (query) city longtitude 
     - parameter lang: (query) language code 
     - parameter appid: (query) api key 
     - parameter units: (query) units (metric/imperial(default)) (optional)
     - returns: RequestBuilder<CityWeather> 
     */
    open class func everythingGetWithRequestBuilder(lat: Double, lon: Double, lang: String, appid: String, units: String? = nil) -> RequestBuilder<CityWeather> {
        let path = "/weather/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "lat": lat.encodeToJSON(), 
            "lon": lon.encodeToJSON(), 
            "lang": lang.encodeToJSON(), 
            "appid": appid.encodeToJSON(), 
            "units": units?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<CityWeather>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}