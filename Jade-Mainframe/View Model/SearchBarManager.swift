//
//  SearchBarManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 24/06/21.
//

import Foundation

class SearchBarManager: ObservableObject {
    // MARK: - Published variables

    @Published var searchText: String

    // MARK: - Constants

    let symbolName: String = "magnifyingglass"

    // MARK: - Initialization

    init(searchText: String = "") {
        self.searchText = searchText
    }
}
