//
//  CarouselManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation

class CarouselManager: ObservableObject {
    // MARK: - Published variables

    @Published var carousel: Carousel

    // MARK: - Constants

    let locale: String

    // MARK: - Initialization

    init(carousel: Carousel, locale: String = Strings.locale) {
        self.carousel = carousel
        self.locale = locale
    }

    // MARK: - Methods

    func formattedPrice(value: Double) -> String {
        priceFormatter(price: value, locale: locale)
    }
}
