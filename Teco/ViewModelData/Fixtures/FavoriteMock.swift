//
//  FavoriteMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

#if DEBUG
    extension FavoritedItem {
        static func fixture(
            announcementName: String = "iPhone 12",
            productPrice: Double = 5324,
            isWatched: Bool = false
        ) -> FavoritedItem {
            .init(announcementName: announcementName,
                  productPrice: productPrice,
                  isWatched: isWatched,
                  product: .fixture())
        }

        static func fixtureWatched(
            announcementName: String = "iPhone 12",
            productPrice: Double = 5324,
            isWatched: Bool = true
        ) -> FavoritedItem {
            .init(announcementName: announcementName,
                  productPrice: productPrice,
                  isWatched: isWatched,
                  product: .fixture())
        }
    }
#endif
