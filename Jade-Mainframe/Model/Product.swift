//
//  Product.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let productName: String
    let productPrice: Double
    let productDiscount: Double
    let imageName: String
}
