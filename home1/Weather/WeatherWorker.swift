//
//  WeatherWorker.swift
//  home1
//
//  Created by Admin on 1/8/20.
//  Copyright © 2020 Serg. All rights reserved.
//

import Foundation

class WeatherWorker {
    func loadCountryJson() -> Country? {
        if let url = Bundle.main.url(forResource: "ru-cities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let country = try decoder.decode(Country.self, from: data)
                return country
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}