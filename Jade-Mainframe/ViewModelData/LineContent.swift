//
//  ListContent.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

struct LineContent: Identifiable {
    var id = UUID()
    let iconURL: String
    let description: String
    let arrowIcon: String = "chevron.right"
}
