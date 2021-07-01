//
//  SettingsEntryMock.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import Foundation

#if DEBUG
    extension SettingsEntry {
        static func fixture(
            iconName: String = "pencil",
            description: String = "blablabla"
        ) -> SettingsEntry {
            .init(iconName: iconName,
                  description: description)
        }
    }

#endif
