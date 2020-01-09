//
//  City.swift
//  home1
//
//  Created by Admin on 1/8/20.
//  Copyright © 2020 Serg. All rights reserved.
//

import Foundation

class Country: Codable, Identifiable {
    var name: String
    var regions: [Region]
}

class Region: Codable, Identifiable {
    var name: String
    var cities: [City]
}

class City: Codable, Identifiable {
    var name: String
    var lat: Float
    var lng: Float
    var cityWeather: CityWeather?
}
