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
    @Published var binocularsImageName: String

    // MARK: - Constants

    let heartImageName: String = Assets.Images.Icons.filledHeart.name

    // MARK: - Initialization

    init(favorite item: FavoritedItem) {
        self.item = item
        binocularsImageName = ""
        updateBinocularsImageName()
    }

    // MARK: - Methods

    func handleBinocularsClick() {
        item.isWatched.toggle()
    }

    private func updateBinocularsImageName() {
        binocularsImageName = item.isWatched ?
            Assets.Images.Icons.filledBinoculars.name :
            Assets.Images.Icons.binoculars.name
    }
}
