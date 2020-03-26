//
//  ContentView.swift
//  SegmentedControl
//
//  Created by exey on 19.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI

import SwiftUICharts

struct ButtonPressStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.black : Color.gray)
      .cornerRadius(10.0)
  }

}

protocol ContentViewProtocol {
    init(serviceLocator: ServiceLocator)
}

struct ContentView: View {
    private var serviceLocator: ServiceLocator
    @State private var selection = 0
    
    @State private var endpoints = ["Pie", "Bar", "Line"]
    
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }
    
    var body: some View {

        VStack {
            Picker(selection: $selection, label: Text("3 source of charts")) {
                ForEach(0 ..< endpoints.count) { i in
                    Text(self.endpoints[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if self.selection == 0 {
                PieViewImplementation(gitService: serviceLocator.getService()!)
            } else if self.selection == 1 {
                BarViewImplementation(newsService: serviceLocator.getService()!)
            } else if self.selection == 2 {
                LineView()
            }
            
            Spacer()
        }
       // .padding(.horizontal, 20)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(serviceLocator: <#T##ServiceLocator#>)
//    }
//}
