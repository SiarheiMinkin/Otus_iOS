//
// CityWeather.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct CityWeather: Codable {

    public var coord: Coord?
    public var weather: [Weather]?
    public var main: Main?
    public var wind: Wind?
    public var id: Double?
    public var name: String?
    public var cod: Double?
    public var url: String?
    public var urlToImage: String?
    public var publishedAt: String?
    public var content: String?

    public init(coord: Coord?, weather: [Weather]?, main: Main?, wind: Wind?, id: Double?, name: String?, cod: Double?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.coord = coord
        self.weather = weather
        self.main = main
        self.wind = wind
        self.id = id
        self.name = name
        self.cod = cod
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }


}
