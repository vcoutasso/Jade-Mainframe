//
//  ListMock.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

#if DEBUG
    extension ListContent {
        static func fixture(
            title: String,
            list: [LineContent] = [LineContent(iconURL: "pencil", description: "blabla"),
                                   LineContent(iconURL: "pencil", description: "kkkkk")]
        ) -> ListContent {
            .init(title: title, list: list)
        }
    }

#endif
