//
//  JadeMainframeApp.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

@main
struct TecoApp: App {
    var userFavorites = FavoritesData()

    var body: some Scene {
        WindowGroup {
            ContentView(userFavorites: userFavorites)
                .environmentObject(userFavorites)
        }
    }
}
