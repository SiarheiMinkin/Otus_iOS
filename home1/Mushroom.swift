//
//  Mushroom.swift
//  home1
//
//  Created by Serg on 10/12/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

struct Mushroom: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}
