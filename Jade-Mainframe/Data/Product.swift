//
//  Product.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    let productName: String
    let productPrice: Double
    let imageName: String
    
}
