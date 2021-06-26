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
            productName: String = "IPhone X",
            productPrice: Double = 1299,
            imageName: String = ""
        ) -> Product {
            .init(productName: productName, productPrice: productPrice, imageName: imageName)
        }
    }
#endif
