//
//  ListManager.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

class ListManager: ObservableObject {
    // MARK: - Published variables

    @Published var title: String
    @Published var content: ListContent

    // MARK: - Initialization

    init(title: String, content: ListContent) {
        self.title = title
        self.content = content
    }
}
