//
//  AvailableModels.swift
//  Jade-Mainframe
//
//  Created by João Pedro Picolo on 30/06/21.
//

import SwiftUI

class AvailableModels: ObservableObject {
    @Published var models: [AvailableModel] = []
    @Published var colors: [Any] = []
    @Published var memories: [Any] = []
}
