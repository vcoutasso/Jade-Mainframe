//
//  CarouselMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 26/06/21.
//

import Foundation

#if DEBUG
    extension Carousel {
        static func fixture(
            products: [Product] = [Product](repeating: .fixture(), count: 10),
            categoryTitle: String = "Adicionados Recentemente"
        ) -> Carousel {
            .init(products: products, categoryTitle: categoryTitle, displayTitle: categoryTitle)
        }

        static func fixtureDiscount(
            products: [Product] = [Product](repeating: .fixtureDiscount(), count: 10),
            categoryTitle: String = "Em Promoção"
        ) -> Carousel {
            .init(products: products, categoryTitle: categoryTitle, displayTitle: categoryTitle)
        }
    }
#endif
