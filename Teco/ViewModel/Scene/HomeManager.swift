//
//  HomeManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

class HomeManager: ObservableObject {
    // MARK: - Published Variables

    @Published var searchBarViewModel: SearchBarManager
    @Published var storiesViewModel: StoriesManager
    @Published var carouselViewModel: CarouselManager

    // MARK: - Services

    private let service = ProductService()

    // MARK: - Initialization

    init(searchBar: SearchBarManager, stories: StoriesManager, carousel: CarouselManager) {
        searchBarViewModel = searchBar
        storiesViewModel = stories
        carouselViewModel = carousel
    }

    // MARK: - Public Methods

    func fetchData() {
        carouselViewModel.handleFetchProduct()
        storiesViewModel.handleFetchProduct()

        objectWillChange.send()
    }
}
