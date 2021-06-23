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
        productName: String = "Product",
        imageName: String = ""
    ) -> Product {
        .init(productName: productName, imageName: imageName)
    }
}
#endif
