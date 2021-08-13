//
//  Carousel.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 26/06/21.
//

import Foundation

struct Carousel: Identifiable {
    var id = UUID()
    var products: [Product]
    let categoryTitle: String
    let displayTitle: String
}
