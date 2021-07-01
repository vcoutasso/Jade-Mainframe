//
//  StoriesService.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 01/07/21.
//

import Foundation

class StoriesService {
    func fetchProduct(table: String, _ completion: @escaping ([Product]) -> Void) {
        CloudKitAvailableModels.fetch(tableName: table) { result in
            switch result {
            case let .success(products):
                completion(products)
            case let .failure(err):
                print(err)
            }
        }
    }
}
