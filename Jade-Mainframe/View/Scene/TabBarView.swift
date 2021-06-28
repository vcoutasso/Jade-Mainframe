//
//  TabBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct TabBarView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: TabBarManager

    // MARK: - Body

    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: viewModel.homeSymbolName)
                Text(Strings.homeTabName)
            }
            RegisterSaleView().tabItem {
                Image(systemName: viewModel.sellingSymbolName)
                Text(Strings.sellingTabName)
            }
            FavoritesView().tabItem {
                Image(systemName: viewModel.favoritesSymbolName)
                Text(Strings.favoritesTabName)
            }
            ProfileView().tabItem {
                Image(systemName: viewModel.profileSymbolName)
                Text(Strings.profileTabName)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    private static let mockViewModel: TabBarManager = .init()

    static var previews: some View {
        TabBarView(viewModel: mockViewModel)
    }
}
