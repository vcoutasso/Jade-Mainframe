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

    // MARK: - Inistilization

    init(products: [Product]) {
        self.products = products
    }
}
