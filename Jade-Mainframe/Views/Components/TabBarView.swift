//
//  TabBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text(L10n.homeTabName)
            }
            RegisterSaleView().tabItem {
                Image(systemName: "tag")
                Text(L10n.sellTabName)
            }
            FavoritesView().tabItem {
                Image(systemName: "suit.heart")
                Text(L10n.favoritesTabName)
            }
            ProfileView().tabItem {
                Image(systemName: "person")
                Text(L10n.profileTabName)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
