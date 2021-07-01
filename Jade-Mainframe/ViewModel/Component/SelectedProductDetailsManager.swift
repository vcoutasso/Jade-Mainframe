//
//  SelectedProductDetailsManager.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import Foundation

class SelectedProductDetailsManager: ObservableObject {
    // MARK: - Published variables

    @Published var product: Product

    // MARK: - Initialization

    init(product: Product) {
        self.product = product
    }
}
