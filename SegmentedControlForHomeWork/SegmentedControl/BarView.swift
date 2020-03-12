//
//  BarView.swift
//  SegmentedControl
//
//  Created by Admin on 3/11/20.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

import SwiftUICharts

struct BarView: View {
    
    @State private var showChart = false
    @State var appleCount = 0 {
        didSet {
            print("appleCount = \(appleCount)")
        }
    }
    @State var bitcoinCount = 0 {
        didSet {
            print("bitcoinCount = \(bitcoinCount)")
        }
    }
    @State var nginxCount = 0 {
        didSet {
            print("nginxCount = \(nginxCount)")
        }
    }
    
    init() {
    }
    
    
    
    var body: some View {
        NewsService().getAppleCount(completion: {result in
            if case .success(let count) = result {
                self.appleCount = count
                
            }
        })
        NewsService().getBitcoinCount(completion: {result in
            if case .success(let count) = result {
                self.bitcoinCount = count
                
            }
        })
        NewsService().getNginxCount(completion: {result in
            if case .success(let count) = result {
                self.nginxCount = count
                
            }
        })
        return VStack{
            if (nginxCount > 0 && bitcoinCount > 0 && appleCount > 0) {
                VStack {
                    BarChartView(data: ChartData(values: [("Apple",appleCount), ("Bitcoin",bitcoinCount), ("nginx",nginxCount)]), title: "Sales", legend: "Quarterly")
                }
                .padding(.all, 10)
            } else {
                Text("Loading...")
            }
        }
        
    }
    
}
