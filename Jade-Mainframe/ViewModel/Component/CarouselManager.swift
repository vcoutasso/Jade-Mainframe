//
//  CarouselManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation

class CarouselManager: ObservableObject {
    // MARK: - Published variables

    @Published var carousels: [Carousel]

    // MARK: - Constants

    let locale: String

    // MARK: - Initialization

    init(carousels: [Carousel], locale: String = Strings.locale) {
        self.carousels = carousels
        self.locale = locale
    }
}
