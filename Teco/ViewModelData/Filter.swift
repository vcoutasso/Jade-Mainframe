//
//  Filter.swift
//  Teco
//
//  Created by João Pedro Picolo on 01/07/21.
//

import SwiftUI

class Filter: Identifiable {
    let id = UUID()
    var name: String = ""
    var availables: [String] = []

    @Published var isOpen: Bool = false
    @Published var selected: [Bool] = []

    init(name: String, availables: [String], selected: [Bool]) {
        self.name = name
        self.availables = availables
        self.selected = selected
    }
}
