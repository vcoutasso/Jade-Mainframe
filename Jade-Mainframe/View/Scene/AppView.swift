//
//  AppView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct AppView: View {
    // MARK: - Variables

    @ObservedObject var tabBarManager: TabBarManager

    var homeView = HomeView()
    var registerSaleView = RegisterSaleView()
    var favoritesView = FavoritesView()
    var profileView = ProfileView()

    // MARK: - Body

    var body: some View {
        TabView {
            homeView.tabItem {
                Image(systemName: tabBarManager.homeSymbolName)
                Text(Strings.homeTabName)
            }
            registerSaleView.tabItem {
                Image(systemName: tabBarManager.sellingSymbolName)
                Text(Strings.sellingTabName)
            }
            favoritesView.tabItem {
                Image(systemName: tabBarManager.favoritesSymbolName)
                Text(Strings.favoritesTabName)
            }
            profileView.tabItem {
                Image(systemName: tabBarManager.profileSymbolName)
                Text(Strings.profileTabName)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    private static let mockViewModel: TabBarManager = .init()

    static var previews: some View {
        AppView(tabBarManager: mockViewModel)
    }
}
