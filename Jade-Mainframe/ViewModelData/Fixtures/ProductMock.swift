//
//  ProductMock.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import Foundation

#if DEBUG
    extension Product {
        static func fixture(
            productName: String = "iPhone X",
            productPrice: Double = 1299,
            imageName: String = ""
        ) -> Product {
            .init(
                productName: productName,
                productPrice: productPrice,
                productDiscount: 0,
                imageName: imageName
            )
        }

        static func fixtureDiscount(
            productName: String = "iPhone 12",
            productPrice: Double = 3899,
            productDiscount: Double = 900,
            imageName: String = ""
        ) -> Product {
            .init(
                productName: productName,
                productPrice: productPrice,
                productDiscount: productDiscount,
                imageName: imageName
            )
        }
    }
#endif
