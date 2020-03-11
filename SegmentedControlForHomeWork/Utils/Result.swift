//
//  Result.swift
//  SegmentedControl
//
//  Created by Serg on 05/03/2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
