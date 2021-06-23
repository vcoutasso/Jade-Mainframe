//
//  CarouselViewModel.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation

class CarouselViewModel: ObservableObject {
    // MARK: - Published variables
    @Published var products: [Product]
    @Published var categoryTitle: String
    
    // MARK: - Initialization
    init(products: [Product], categoryTitle: String) {
        self.products = products
        self.categoryTitle = categoryTitle
    }
}
