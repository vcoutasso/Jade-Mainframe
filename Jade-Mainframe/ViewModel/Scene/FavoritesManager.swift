//
//  FavoritesManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

class FavoritesManager: ObservableObject {
    // MARK: - Published Variables

    @Published var favoritedItems: [FavoritedItem]

    // MARK: - Constants

    var watchListSymbolName: String = "binoculars"

    // MARK: - Initialization

    init(favoritedItems: [FavoritedItem]) {
        self.favoritedItems = favoritedItems
    }
}
