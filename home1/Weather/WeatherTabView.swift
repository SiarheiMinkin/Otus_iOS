//
//  WeatherTabView.swift
//  home1
//
//  Created by Admin on 1/4/20.
//  Copyright © 2020 Serg. All rights reserved.
//

import SwiftUI

final class CitiesListViewModel: ObservableObject {
    @Published private(set) var cityLoadingIndex: Int = 0
    @Published var isNewPageLoading = false
    @Published private(set) var cities: [City] =  {
        var result = [City]()
        guard let regions = WeatherWorker().loadCountryJson()?.regions else {
            return result
        }
        for region in regions {
            result.append(contentsOf: region.cities)
        }
        return result
    }()
    @Published var citiesWithWeather = [City]()
    
    func cityWeatherLoad() {
        guard isNewPageLoading == false else {
            return
        }
        guard self.cityLoadingIndex < cities.count else {
            return
        }
        self.isNewPageLoading = true
        let city = self.cities[self.cityLoadingIndex]
        WeatherAPI.everythingGet(lat: Double(city.lat), lon: Double(city.lng), lang: "ru", appid: "43ce20e0c8ddaa7ff028165cdfede88d") { (cityWeather, error) in
            city.cityWeather = cityWeather
            self.citiesWithWeather.append(contentsOf: [city])
            self.isNewPageLoading = false
        }
        self.cityLoadingIndex += 1
    }
}

struct WeatherTabView: View {
    
    
    @EnvironmentObject var citiesListViewModel: CitiesListViewModel
    @State var selectedSegmentIndex: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                SegmentedControl(items: ["Россия", "Беларусь"], selectedSegmentIndex: $selectedSegmentIndex)
                List(citiesListViewModel.citiesWithWeather) { s in
                    if self.citiesListViewModel.isNewPageLoading &&  self.citiesListViewModel.cities.isLastItem(s) {
                        Divider()
                        Text("Loading...")
                    } else {
                        VStack {
                            Text(s.name).fontWeight(Font.Weight.bold).foregroundColor(.red)
                            ForEach((s.cityWeather?.weather ?? []), id: \.id){ weather in
                                Text(weather.description ?? "")
                            }
                            VStack {
                                Text("температура: " + String(format: "%.1f", s.cityWeather?.main?.temp ?? 0))
                                Text("ощущается как: " + String(format: "%.1f", s.cityWeather?.main?.feelsLike ?? 0))
                                Text("минимальная температура: " + String(format: "%.1f", s.cityWeather?.main?.tempMin ?? 0))
                                Text("максимальная температура: " + String(format: "%.1f", s.cityWeather?.main?.tempMax ?? 0))
                                Text("давление: " + String(format: "%.1f", s.cityWeather?.main?.pressure ?? 0))
                                Text("влажность: " + String(format: "%.1f", s.cityWeather?.main?.humidity ?? 0))
                            }

                            
                            
                        }.onAppear {
                            self.onItemShowed(item: s)
                        }
                        
                    }
                    
                }
            }
            
        }.onAppear {
            self.citiesListViewModel.cityWeatherLoad()
        }
        
    }
}

extension WeatherTabView {
    func onItemShowed<T:Identifiable>(item: T) {
        if self.citiesListViewModel.citiesWithWeather.isLastItem(item) {
            self.citiesListViewModel.cityWeatherLoad()
        }
    }
}

struct WeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTabView().environmentObject(CitiesListViewModel())
    }
}
