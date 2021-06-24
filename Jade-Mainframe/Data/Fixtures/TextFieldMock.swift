//
//  TextFieldMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import Foundation
import SwiftUI

#if DEBUG
    extension TextFieldViewModel {
        static func fixture(
            title: String = "Description",
            placeholderText: String = "Product description",
            isRequired: Bool = false,
            numbersOnly: Bool = false,
            autocapitalizationType: UITextAutocapitalizationType = .none
        ) -> TextFieldViewModel {
            .init(title: title, placeholderText: placeholderText, isRequired: isRequired, numbersOnly: numbersOnly, autocapitalizationType: autocapitalizationType)
        }

        static func fixtureRequired(
            title: String = "Price*",
            placeholderText: String = "Price (R$)",
            isRequired: Bool = true,
            numbersOnly: Bool = true,
            autocapitalizationType: UITextAutocapitalizationType = .none
        ) -> TextFieldViewModel {
            .init(title: title, placeholderText: placeholderText, isRequired: isRequired, numbersOnly: numbersOnly, autocapitalizationType: autocapitalizationType)
        }
    }
#endif
