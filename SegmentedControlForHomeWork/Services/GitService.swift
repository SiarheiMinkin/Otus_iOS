//
//  GitService.swift
//  SegmentedControl
//
//  Created by Serg on 05/03/2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import GitAPIClient

class GitService {
    func getCotlinCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "Cotlin", completion: completion)
    }
    
    func getObjCCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "ObjC", completion: completion)
    }
    
    func getSwiftCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "Swift", completion: completion)
    }
    
    func getCount(search: String, completion: @escaping ((Result<Int>)->())) {
        SearchAPI.searchReposGet(q: search, order: .asc) { (list, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(list?.totalCount ?? 0))
            }
        }
    }
    
}
