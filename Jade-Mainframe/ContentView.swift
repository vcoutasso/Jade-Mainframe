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
            .onAppear {
                // MARK: - fetch annoucements from CloudKit

                CloudKitAnnoucements.fetch { result in
                    switch result {
                    case let .success(newItem):
                        if newItem.discount! > 0 {
                            mockHome.carousel.carousels[0].products.append(newItem)
                        } else {
                            mockHome.carousel.carousels[1].products.append(newItem)
                        }
                    case let .failure(err):
                        print(err)
                    }
                }
                CloudKitAvailableModels.fetch { result in
                    switch result {
                    case let .success(newItem):
                        print(newItem)
                        mockHome.stories.products.append(newItem)
                    case let .failure(err):
                        print(err)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
