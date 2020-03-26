//
//  BarView.swift
//  SegmentedControl
//
//  Created by Admin on 3/11/20.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

import SwiftUICharts

protocol BarView {
    init(newsService: NewsService)
}

struct BarViewImplementation: View, BarView {
    fileprivate var newsService: NewsService
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
    
    init(newsService: NewsService) {
        self.newsService = newsService
    }
    
    
    
    var body: some View {
        newsService.getAppleCount(completion: {result in
            if case .success(let count) = result {
                self.appleCount = count
                
            }
        })
        newsService.getBitcoinCount(completion: {result in
            if case .success(let count) = result {
                self.bitcoinCount = count
                
            }
        })
        newsService.getNginxCount(completion: {result in
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
