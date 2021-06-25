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
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            RegisterSaleView().tabItem {
                Image(systemName: "tag")
                Text("Home")
            }
            FavoritesView().tabItem {
                Image(systemName: "suit.heart")
                Text("Favoritos")
            }
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
