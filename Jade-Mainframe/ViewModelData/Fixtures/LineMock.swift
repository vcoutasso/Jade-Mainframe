//
//  ListMock.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

#if DEBUG
    extension LineContent {
        static func fixture(
            iconURL: String = "pencil",
            description: String = "blablabla"
        ) -> LineContent {
            .init(iconURL: iconURL,
                  description: description)
        }
    }

#endif
