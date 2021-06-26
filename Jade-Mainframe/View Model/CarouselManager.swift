//
//  CarouselManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation

class CarouselManager: ObservableObject {
    // MARK: - Published variables

    @Published var products: [Product]
    @Published var categoryTitle: String
    @Published var locale: String

    // MARK: - Initialization

    init(products: [Product], categoryTitle: String, locale: String = L10n.locale) {
        self.products = products
        self.categoryTitle = categoryTitle
        self.locale = locale
    }

    // MARK: - Methods

    func formattedPrice(value: Double) -> String {
        priceFormatter(price: value, locale: locale)
    }
}
