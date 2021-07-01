//
//  ContentView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Body

    private var mockHome: HomeManager = .init(
        searchBar: SearchBarManager(),
        stories: StoriesManager(products: []),
        carousel: CarouselManager(carousels: [
            Carousel(products: [], categoryTitle: "Descontos"),
            Carousel(products: [], categoryTitle: "Adicionados Recentemente"),
        ]
        )
    )

    private var mockFavorites: FavoritesManager = .init(favoritedItems: [.fixture(), .fixtureWatched()])

    private var mockProfile: ProfileManager = .init(profile: .fixture())

    var body: some View {
        AppView(homeViewManager: mockHome,
                favoritesViewManager: mockFavorites,
                profileViewManager: mockProfile)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
