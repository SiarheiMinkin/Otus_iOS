//
//  LineView.swift
//  SegmentedControl
//
//  Created by Admin on 3/12/20.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

import SwiftUICharts

struct LineView: View {
    init() {
    }
    var body: some View {
        
        let dataArray = Histogram().histogram.map { (arg0) -> Double in
            let (_, value) = arg0
            return Double(value)
        }
        return VStack{
                LineChartView(data: dataArray, title: "Histogram")
        }
    }
}
