//
//  CarouselMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 26/06/21.
//

import Foundation

#if DEBUG
    extension Carousel {
        private static let mockProduct: Product = .fixture()
        static func fixture(
            products: [Product] = [Product](repeating: mockProduct, count: 10),
            categoryTitle: String = "Adicionados Recentemente"
        ) -> Carousel {
            .init(products: products, categoryTitle: categoryTitle)
        }
    }
#endif
