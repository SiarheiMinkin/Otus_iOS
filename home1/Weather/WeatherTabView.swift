//
//  WeatherTabView.swift
//  home1
//
//  Created by Admin on 1/4/20.
//  Copyright © 2020 Serg. All rights reserved.
//

import SwiftUI

final class CitiesListViewModel: ObservableObject {
    @Published private(set) var pageIndex: Int = 1
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
    func simulatePageLoad() {
        guard isNewPageLoading == false else {
            return
        }
        self.pageIndex += 1
        self.isNewPageLoading = true
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            let newPage = (self.cities.count...(self.cities.count + 20)).map{"city \($0.name)"}
//            self.cities.append(contentsOf: newPage)
//            self.isNewPageLoading = false
//        }
    }
}

struct WeatherTabView: View {
    
    
    @EnvironmentObject var citiesListViewModel: CitiesListViewModel
    
    var body: some View {
        List(citiesListViewModel.cities) { s in
            if self.citiesListViewModel.isNewPageLoading &&  self.citiesListViewModel.cities.isLastItem(s) {
                Divider()
                Text("Loading...")
            } else {
                Text(s.name).onAppear {
                    self.onItemShowed(item: s)
                }
            }

        }
        
    }
}

extension WeatherTabView {
    func onItemShowed<T:Identifiable>(item: T) {
        
//        if self.citiesListViewModel.cities.isLastItem(item) {
//            self.citiesListViewModel.simulatePageLoad()
//        }
    }
}

struct WeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTabView().environmentObject(CitiesListViewModel())
    }
}
