//
//  ContentViewPresenter.swift
//  SegmentedControl
//
//  Created by Serg on 06/03/2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import SwiftUI

protocol PieViewPresenter {
    func showPieChart( on view: inout PieViewProtocol)
}

//class PieViewPresenterImplementation: PieViewPresenter{

    

//    func showPieChart( on view: inout PieViewProtocol) {
//        GitService().getCotlinCount(completion: {result in
//            if case .success(let count) = result {
//                DispatchQueue.main.async {
//                   view.cotlinCount = count
//                }
//                
//            }
//        })
//        
//    }
//}
