//
//  CarouselManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation

class CarouselManager: ObservableObject {
    // MARK: - Published variables

    @Published var carousels: [Carousel] {
        willSet {
            objectWillChange.send()
        }
    }

    // MARK: - Constants

    let locale: String

    // MARK: - Initialization

    init(carousels: [Carousel], locale: String = Strings.locale) {
        self.carousels = carousels
        self.locale = locale
    }

    func handleFetchProduct() {
        for idx in 0 ..< carousels.count {
            ProductService().fetchProduct(table: carousels[idx].categoryTitle) { products in
                self.carousels[idx].products = products
            }
        }

        objectWillChange.send()
    }
}
