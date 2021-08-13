//
//  StoriesManager.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

class StoriesManager: ObservableObject {
    // MARK: - Published variables

    @Published var products: [Product]

    let moreSymbolName: String = "plus"
    let service: StoriesService = .init()

    // MARK: - Inistilization

    init(products: [Product]) {
        self.products = products
    }

    func handleFetchProduct() {
        service.fetchProduct(table: "AvailableModels") { products in
            self.products = products
        }

        objectWillChange.send()
    }
}
