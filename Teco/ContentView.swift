//
//  ContentView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showTutorial") var showTutorial: Bool = true

    @ObservedObject var userFavorites: FavoritesData

    @ObservedObject private var mockHome: HomeManager = .init(
        searchBar: SearchBarManager(),
        stories: StoriesManager(products: []),
        carousel: CarouselManager(carousels: [
            Carousel(products: [], categoryTitle: "AnnouncedIphones", displayTitle: "Adicionados recentemente"),
            Carousel(products: [], categoryTitle: "AnnouncedDiscounts", displayTitle: "Descontos para você"),
        ]
        )
    )

    @ObservedObject private var mockFavorites: FavoritesManager = .init(favoritedItems: [.fixture(), .fixtureWatched()])

    @ObservedObject private var mockProfile: ProfileManager = .init(
        profile: .fixture())

    // MARK: - Body

    var body: some View {
        AppView(homeViewManager: mockHome,
                favoritesViewManager: mockFavorites,
                profileViewManager: mockProfile)
            .onAppear {
                mockHome.fetchData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userFavorites: .init(favorites: []))
    }
}
