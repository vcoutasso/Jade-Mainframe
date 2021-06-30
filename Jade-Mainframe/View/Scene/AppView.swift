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

    var tabBarManager: TabBarManager = .init()

    // MARK: - Body

    var body: some View {
        TabView {
            HomeView(viewModel: homeViewManager).tabItem {
                Image(systemName: tabBarManager.homeSymbolName)
                Text(Strings.homeTabName)
            }
            RegisterSaleView().tabItem {
                Image(systemName: tabBarManager.sellingSymbolName)
                Text(Strings.sellingTabName)
            }
            FavoritesView().tabItem {
                Image(systemName: tabBarManager.favoritesSymbolName)
                Text(Strings.favoritesTabName)
            }
            ProfileView().tabItem {
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

    static var previews: some View {
        AppView(homeViewManager: mockHome)
    }
}
