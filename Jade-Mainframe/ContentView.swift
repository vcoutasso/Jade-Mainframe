//
//  ContentView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Body

    var body: some View {
        AppView(tabBarManager: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
