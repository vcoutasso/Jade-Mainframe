//
//  FieldManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation
import SwiftUI

class FieldManager: ObservableObject {
    // MARK: - Published Variables

    @Published var field: Field
    @Published var displayedTitle: String = ""

    // MARK: - Constants

    static let maxPriceLength: Int = 10
    static let maxStringLength: Int = 200

    // MARK: - Initialization

    init(
        title: String,
        placeholderText: String,
        isRequired: Bool,
        style: FieldStyle,
        inputText: String = "",
        titleColor: Color = .black,
        autocapitalizationType: UITextAutocapitalizationType = .none
    ) {
        displayedTitle = title
        field = .init(
            title: title,
            placeholderText: placeholderText,
            isRequired: isRequired,
            style: style,
            inputText: inputText,
            titleColor: titleColor,
            maxLength: style == .price ? FieldManager.maxPriceLength : FieldManager.maxStringLength,
            autocapitalizationType: autocapitalizationType
        )

        // Title optionally adds a visual/textual indicator that the field is required and must be filled
        if let last = title.last {
            if field.isRequired, String(last) != L10n.requiredFieldSymbol {
                displayedTitle.append(L10n.requiredFieldSymbol)
            }
        }
    }

    // MARK: - View methods

    func handleTitleColor() {
        field.titleColor = field.isRequired && field.inputText.isEmpty ? .red : .black
        objectWillChange.send()
    }

    func handleTextReceive(inputValue: String) {
        let filtered = inputValue.filter { "0123456789".contains($0) }
        if filtered != inputValue {
            field.inputText = filtered
            objectWillChange.send()
        }
    }
}
