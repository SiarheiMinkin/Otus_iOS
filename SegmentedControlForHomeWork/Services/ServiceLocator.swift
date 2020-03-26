//
//  ServiceLocator.swift
//  SegmentedControl
//
//  Created by Admin on 3/26/20.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

protocol ServiceLocator {
    func getService<T>() -> T?
}

class ServiceLocatorImplementation: ServiceLocator {
    private lazy var services: Dictionary<String, Any> = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ?
            "\(some)" : "\(type(of: some))"
    }

    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        print(key)
        services[key] = service
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        print(key)
        return services[key] as? T
    }
}
