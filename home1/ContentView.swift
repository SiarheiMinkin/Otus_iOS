//
//  ContentView.swift
//  home1
//
//  Created by Serg on 05/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var mushRoomListModel = MushroomListModel()
    
    var body: some View {
        
        TabView(selection: $selection) {
            FirstTabView(selectedTabIndex: $selection).environmentObject(mushRoomListModel).tabItem {
                Text("Любимый гриб")
            }.tag(0)
            MashroomListView(selectedTabIndex: $selection).environmentObject(mushRoomListModel).tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("Mushroom list")
                }
            }.tag(1)
            
            ThirdTabView().tabItem {Text("Tab 3")}.tag(2)
            
        }
    }
}


