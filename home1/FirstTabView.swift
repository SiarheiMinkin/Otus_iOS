//
//  FirstTabView.swift
//  home1
//
//  Created by Serg on 10/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import SwiftUI

struct FirstTabView: View {
    @Binding var selectedTabIndex: Int
    @EnvironmentObject var mashroomListModel: MushroomListModel
    
    var body: some View {
        Button(action: {
            self.selectedTabIndex = 0
            self.mashroomListModel.selectedItem = self.mashroomListModel.mushrooms[0]
            
        }) {
            Text("Белый гриб")
        }
    }
}
