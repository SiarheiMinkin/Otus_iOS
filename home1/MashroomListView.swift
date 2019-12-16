//
//  MashroomList.swift
//  home1
//
//  Created by Serg on 09/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import SwiftUI


struct MashroomListView: View {
    @Binding var selectedTabIndex: Int
    @EnvironmentObject var mashroomListModel: MushroomListModel
    var body: some View {
        NavigationView {
                List {
                    ForEach(mashroomListModel.mushrooms) {mushroom in
                        
                        NavigationLink(destination: MushroomDetailView(mushroom: mushroom), tag: mushroom, selection: self.$mashroomListModel.selectedItem) {
                           Text(mushroom.name)
                        }

                    }
            }.navigationBarTitle("Грибы")
            
        }

    }
}


