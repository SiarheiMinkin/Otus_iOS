//
//  NewsService.swift
//  SegmentedControl
//
//  Created by Admin on 3/11/20.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import NewsAPIClient

class NewsService {
    func getAppleCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "Apple", completion: completion)
    }
    
    func getBitcoinCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "bitcoin", completion: completion)
    }
    
    func getNginxCount(completion: @escaping ((Result<Int>)->())) {
        getCount(search: "nginx", completion: completion)
    }
    
    func getCount(search: String, completion: @escaping ((Result<Int>)->())) {
        ArticlesAPI.everythingGet(q: search, from: "", sortBy: "", apiKey: "9a306ec7acce49ad86f7af42bc5df466") { (list, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(list?.totalResults ?? 0))
            }
        }

    }
    
}
