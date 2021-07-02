//
//  FavoriteCardManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

struct FavoritedItem: Identifiable {
    let id = UUID()
    let announcementName: String
    let productPrice: Double
    var isWatched: Bool
    let product: Product
}
