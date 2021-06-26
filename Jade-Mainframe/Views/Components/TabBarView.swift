//
//  TabBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: TabBarViewModel

    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: viewModel.homeSymbolName)
                Text(L10n.homeTabName)
            }
            RegisterSaleView().tabItem {
                Image(systemName: viewModel.sellSymbolName)
                Text(L10n.sellTabName)
            }
            FavoritesView().tabItem {
                Image(systemName: viewModel.favoritesSymbolName)
                Text(L10n.favoritesTabName)
            }
            ProfileView().tabItem {
                Image(systemName: viewModel.profileSymbolName)
                Text(L10n.profileTabName)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    private static let mockView: TabBarViewModel = .init()

    static var previews: some View {
        TabBarView(viewModel: mockView)
    }
}
