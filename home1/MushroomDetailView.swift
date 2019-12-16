//
//  AboutView.swift
//  home1
//
//  Created by Serg on 10/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import SwiftUI

struct MushroomDetailView: View {
    var mushroom: Mushroom
    var body: some View {
        VStack {
            Image(self.mushroom.imageName).resizable()
            .frame(width: 100.0, height: 100.0)
            Text(self.mushroom.description).padding(20)
        }

    }
}
