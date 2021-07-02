//
//  FavoriteCardManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation
import SwiftUI

class FavoriteCardManager: ObservableObject {
    // MARK: - Published Variables

    @Published var item: FavoritedItem
//    @Published var binocularsImageName: String

    @Published var isWatched: Bool

    // MARK: - Constants

    let heartImageName: String = Assets.Images.Icons.filledHeart.name

    // MARK: - Initialization

    init(favorite item: FavoritedItem, isWatched: Bool = false) {
        self.item = item
        self.isWatched = isWatched
    }

    // MARK: - Methods

    func handleBinocularsClick() {
        item.isWatched.toggle()
    }

    func handleFavoriteToggle(userFavorites: FavoritesData) {
        userFavorites.favorites = userFavorites.favorites.filter { $0.product.recordID != item.product.recordID }

        objectWillChange.send()

        userFavorites.objectWillChange.send()
    }

    func handleBinocularToggle() {
        isWatched.toggle()

        item.isWatched = isWatched

        objectWillChange.send()
    }

//    private func updateBinocularsImageName() {
//        binocularsImageName = item.isWatched ?
//            Assets.Images.Icons.filledBinoculars.name :
//            Assets.Images.Icons.binoculars.name
//    }
}
