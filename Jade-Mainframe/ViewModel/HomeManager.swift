//
//  HomeManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

class HomeManager: ObservableObject {
    // MARK: - Published Variables

    @Published var searchBar: SearchBarManager
    @Published var stories: StoriesManager
    @Published var carousel: CarouselManager

    init(searchBar: SearchBarManager, stories: StoriesManager, carousel: CarouselManager) {
        self.searchBar = searchBar
        self.stories = stories
        self.carousel = carousel
    }
}
