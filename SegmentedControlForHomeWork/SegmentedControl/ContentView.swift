//
//  ContentView.swift
//  SegmentedControl
//
//  Created by exey on 19.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI
import OpenAPIClient

struct ButtonPressStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.black : Color.gray)
      .cornerRadius(10.0)
  }

}

struct PieView: View {
    
    @State private var showChart = false
    
    var body: some View {

        VStack(spacing: 10) {
            
            Button(action: {
                withAnimation {
                    self.showChart.toggle()
                }
            }) {
              Text("Custom Button")
            }
            
            .buttonStyle(ButtonPressStyle())
            
            if showChart {
                Text("Pie Chart")
                .transition(.move(edge: .bottom))
            }
        }
        .padding(.top, 10)
    }
    
}

struct ContentView: View {
    
    @State private var selection = 0
    
    @State private var endpoints = ["Pie", "Bar", "Line"]
    init() {
        SearchAPI.searchReposGet(q: "Cotlin", order: .asc) { (list, error) in
            print(list.debugDescription)
        }
    }
    var body: some View {

        VStack {
            Picker(selection: $selection, label: Text("3 source of charts")) {
                ForEach(0 ..< endpoints.count) { i in
                    Text(self.endpoints[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if self.selection == 0 {
                PieView()
            } else if self.selection == 1 {
                Text("Bar").transition(.scale)
            } else if self.selection == 2 {
                Text("Line")
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
