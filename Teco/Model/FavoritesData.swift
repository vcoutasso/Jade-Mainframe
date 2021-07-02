//
//  FavoritesData.swift
//  Teco
//
//  Created by Vinícius Couto on 01/07/21.
//

import Foundation

class FavoritesData: ObservableObject {
    @Published var favorites: [FavoritedItem]

    init(favorites: [FavoritedItem]) {
        self.favorites = favorites
    }

    init() {
        favorites = []
    }
}
