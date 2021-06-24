//
//  TextFieldViewModel.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 23/06/21.
//

import Foundation
import SwiftUI

class TextFieldViewModel: ObservableObject {
    // MARK: - Constants

    private let maxNumberLength: Int = 10
    private let maxStringLength: Int = 200

    // MARK: - Published Variables

    @Published var titleColor: Color = .black

    @Published var displayedTitle: String
    @Published var placeholderText: String
    @Published var isRequired: Bool
    @Published var numbersOnly: Bool
    @Published var autocapitalizationType: UITextAutocapitalizationType

    @Published var inputText = "" {
        didSet {
            if inputText.count > maxLength, oldValue.count <= maxLength {
                inputText = oldValue
            }
        }
    }

    // MARK: - Private variables

    private var maxLength: Int {
        numbersOnly ? maxNumberLength : maxStringLength
    }

    // MARK: - Initialization

    init(title: String, placeholderText: String, isRequired: Bool, numbersOnly: Bool, autocapitalizationType: UITextAutocapitalizationType = .none) {
        displayedTitle = title
        self.placeholderText = placeholderText
        self.isRequired = isRequired
        self.numbersOnly = numbersOnly
        self.autocapitalizationType = autocapitalizationType

        // Title optionally adds a visual/textual indicator that the field is required and must be filled
        if let last = title.last {
            if self.isRequired, String(last) != L10n.requiredFieldSymbol {
                displayedTitle.append(L10n.requiredFieldSymbol)
            }
        }
    }

    // MARK: - View methods

    func handleTitleColor() {
        titleColor = isRequired && inputText.isEmpty ? .red : .black
        objectWillChange.send()
    }

    func handleTextReceive(inputValue: String) {
        let filtered = inputValue.filter { "0123456789".contains($0) }
        if filtered != inputValue {
            inputText = filtered
            objectWillChange.send()
        }
    }
}
