//
//  PieView.swift
//  SegmentedControl
//
//  Created by Admin on 3/11/20.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

import SwiftUICharts

struct PieView: View {
    
    @State private var showChart = false
    @State var cotlinCount = 0 {
        didSet {
            print("cotlinCount = \(cotlinCount)")
        }
    }
    @State var objCCount = 0 {
        didSet {
            print("objCCount = \(objCCount)")
        }
    }
    @State var swiftCount = 0 {
        didSet {
            print("swiftCount = \(swiftCount)")
        }
    }
    
   init() {
    }
    

    
    var body: some View {
        GitService().getCotlinCount(completion: {result in
            if case .success(let count) = result {
                self.cotlinCount = count
            }
        })
        GitService().getObjCCount(completion: {result in
            if case .success(let count) = result {
                self.objCCount = count
            }
        })
        
        GitService().getSwiftCount(completion: {result in
            if case .success(let count) = result {
                self.swiftCount = count
            }
        })
        return VStack(spacing: 10) {
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
            if objCCount > 0 && swiftCount > 0 && cotlinCount > 0 {
                            PieChartView(data: [Double(objCCount), Double(swiftCount), Double(cotlinCount)], title: "кол-во реп ObjC, Swift, Kotlin")
            } else {
                Text("Loading....")
            }

        }
        .padding(.top, 10)
    }
    
}
