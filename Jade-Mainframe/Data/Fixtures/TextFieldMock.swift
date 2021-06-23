//
//  TextFieldMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import Foundation
import SwiftUI

#if DEBUG
extension TextFieldView {
    static func fixture(
        title: String = "Title",
        placeholderText: String = "Placeholder text",
        isRequired: Bool = false,
        autocapitalizationType: UITextAutocapitalizationType = .none
    ) -> TextFieldView {
        .init(title: title, placeholderText: placeholderText, isRequired: isRequired, autocapitalizationType: autocapitalizationType)
    }
    
    static func fixtureRequired(
        title: String = "Title*",
        placeholderText: String = "Placeholder text",
        isRequired: Bool = true,
        autocapitalizationType: UITextAutocapitalizationType = .none
    ) -> TextFieldView {
        .init(title: title, placeholderText: placeholderText, isRequired: isRequired, autocapitalizationType: autocapitalizationType)
    }
}
#endif
