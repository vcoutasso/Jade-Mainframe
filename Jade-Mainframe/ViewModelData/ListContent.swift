//
//  ListContent.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

struct ListContent: Identifiable {
    var id = UUID()

    let list: [LineContent]
}
