//
//  AppView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct AppView: View {
    // MARK: - Variables

    @ObservedObject var homeViewManager: HomeManager
    @ObservedObject var favoritesViewManager: FavoritesManager
    @ObservedObject var profileViewManager: ProfileManager

    var tabBarManager: TabBarManager = .init()

    // MARK: - Body

    var body: some View {
        TabView {
            HomeView(viewModel: homeViewManager).tabItem {
                Image(systemName: tabBarManager.homeSymbolName)
                Text(Strings.homeTabName)
            }
            .onAppear {
                // MARK: - fetch annoucements from CloudKit

                CloudKitAnnoucements.fetch { result in
                    switch result {
                    case let .success(newItem):
                        if newItem.discount! > 0 {
                            homeViewManager.carousel.carousels[0].products.append(newItem)
                        } else {
                            homeViewManager.carousel.carousels[1].products.append(newItem)
                        }
                    case let .failure(err):
                        print(err)
                    }
                }
            }
            RegisterSaleView().tabItem {
                Image(systemName: tabBarManager.sellingSymbolName)
                Text(Strings.sellingTabName)
            }
            FavoritesView(viewModel: favoritesViewManager).tabItem {
                Image(systemName: tabBarManager.favoritesSymbolName)
                Text(Strings.favoritesTabName)
            }
            ProfileView(viewModel: profileViewManager).tabItem {
                Image(systemName: tabBarManager.profileSymbolName)
                Text(Strings.profileTabName)
            }
        }
        .accentColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }
}

struct TabBarView_Previews: PreviewProvider {
    private static var mockHome: HomeManager = .init(
        searchBar: SearchBarManager(),
        stories: StoriesManager(products: [.fixture(), .fixtureDiscount()]),
        carousel: CarouselManager(carousels: [.fixture(), .fixtureDiscount()]
        )
    )

    private static let mockFavorites: FavoritesManager = .init()

    private static let mockProfile: ProfileManager = .init(profile: .fixture())

    static var previews: some View {
        AppView(homeViewManager: mockHome,
                favoritesViewManager: mockFavorites,
                profileViewManager: mockProfile)
    }
}
