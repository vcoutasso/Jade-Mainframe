//
//  LineManager.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

class LineManager: ObservableObject {
    // MARK: - Published variables

    @Published var lineContent: LineContent

    // MARK: - Initialization

    init(title _: String, lineContent: LineContent) {
        self.lineContent = lineContent
    }
}
