//
//  SegmentedControl.swift
//  home1
//
//  Created by Admin on 1/9/20.
//  Copyright © 2020 Serg. All rights reserved.
//

import SwiftUI

struct SegmentedControl: UIViewRepresentable {
   
    var items: [String]
    @Binding var selectedSegmentIndex: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl()
        for item in items {
            segmentedControl.insertSegment(withTitle: item, at: items.firstIndex(of: item) ?? 0, animated: false)
        }
       
        segmentedControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue(sender:)),
            for: .valueChanged)
        
        return segmentedControl
    }
    
    func updateUIView(_ segmentedControl: UISegmentedControl, context: Context) {
        segmentedControl.selectedSegmentIndex = selectedSegmentIndex
    }
    
    class Coordinator: NSObject {
        var segmentedControl: SegmentedControl
        
        init(_ segmentedControl: SegmentedControl) {
            self.segmentedControl = segmentedControl
        }
        
        @objc func changeValue(sender: UISegmentedControl) {
            segmentedControl.selectedSegmentIndex = sender.selectedSegmentIndex
        }
    }
}
