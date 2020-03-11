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
        SearchAPI.searchReposGet(q: "Cotlin", order: .asc) { (list, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(list?.totalCount ?? 0))
            }
        }
    }
    
}
