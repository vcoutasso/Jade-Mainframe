//
//  SearchBarManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 24/06/21.
//

import Foundation

class SearchBarManager: ObservableObject {
    // MARK: - Published variables

    @Published var searchBar: SearchBar

    // MARK: - Constants

    let symbolName: String = "magnifyingglass"

    // MARK: - Initialization

    init(searchText: String = "") {
        searchBar = SearchBar(searchText: searchText)
    }
}
