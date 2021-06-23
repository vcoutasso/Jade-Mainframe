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
    @Published var title: String
    @Published var placeholderText: String
    @Published var isRequired: Bool
    @Published var numbersOnly: Bool
    @Published var autocapitalizationType: UITextAutocapitalizationType
    
    @Published var text = "" {
        didSet {
            if text.count > maxLength && oldValue.count <= maxLength {
                text = oldValue
            }
        }
    }
    
    var maxLength: Int {
        numbersOnly ? maxNumberLength : maxStringLength
    }
    
    // MARK: - Initialization
    init(title: String, placeholderText: String, isRequired: Bool, numbersOnly: Bool, autocapitalizationType: UITextAutocapitalizationType = .none) {
        self.title = title
        self.placeholderText = placeholderText
        self.isRequired = isRequired
        self.numbersOnly = numbersOnly
        self.autocapitalizationType = autocapitalizationType
    }
    
    // MARK: - View methods
    func handleTitleColor() {
        titleColor = isRequired && text.isEmpty ? .red : .black
        objectWillChange.send()
    }
    
    func handleTextReceive(inputValue: String) {
        let filtered = inputValue.filter { "0123456789".contains($0) }
        if filtered != inputValue {
            text = filtered
            objectWillChange.send()
        }
    }
}
