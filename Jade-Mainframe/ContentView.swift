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
        stories: StoriesManager(products: [.fixture(), .fixtureDiscount()]),
        carousel: CarouselManager(carousels: [.fixture(), .fixtureDiscount()]
        )
    )

    var body: some View {
        AppView(homeViewManager: mockHome)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
