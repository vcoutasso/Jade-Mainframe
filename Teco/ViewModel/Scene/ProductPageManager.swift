//
//  SelectedProductDetailsManager.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import Foundation

class ProductPageManager: ObservableObject {
    // MARK: - Published variables

    @Published var product: Product
    @Published var isFavorite: Bool

    // MARK: - Initialization

    init(product: Product, isFavorite: Bool = false) {
        self.product = product
        self.isFavorite = isFavorite
    }

    func handleFavoriteToggle(userFavorites: FavoritesData) {
        isFavorite.toggle()

        if userFavorites.favorites.filter({ $0.product.recordID == self.product.recordID }).count > 0 {
            userFavorites.favorites = userFavorites.favorites.filter { $0.product.recordID != self.product.recordID }
        }
        else {
            userFavorites.favorites.append(FavoritedItem(
                announcementName: "\(product.model!) \(product.memory!)",
                productPrice: product.price!,
                isWatched: false,
                product: product
            ))
        }
        objectWillChange.send()
    }
}
