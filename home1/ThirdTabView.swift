//
//  ThirdTabView.swift
//  home1
//
//  Created by Serg on 16/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import SwiftUI

struct ThirdTabView: View {
    @State var showDetail = false
    var body: some View {
        VStack {
            Button(action: {
                self.showDetail = true
            }) {
                Text("Open modal")
            }
        }
        .betterSheet(isPresented: $showDetail) { 
            Text("Detail!")
        }
    }
}


