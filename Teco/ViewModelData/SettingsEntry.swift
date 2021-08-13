//
//  ListContent.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

struct SettingsEntry: Identifiable {
    var id = UUID()
    let iconName: String
    let description: String
    let arrowIcon: String = "chevron.right"
}
