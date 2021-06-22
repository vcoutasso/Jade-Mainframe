//
//  TextFieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI
import Combine

struct TextFieldView: View {
    
    @State private var inputText: String = ""
    @State private var titleColor: Color = .black
    
    let title: String
    let placeholderText: String
    let isRequired: Bool
    let numbersOnly: Bool
    let autocapitalizationType: UITextAutocapitalizationType
    
    var body: some View {
        VStack(alignment: .leading) {
            fieldTitle
                .foregroundColor(titleColor)
            textField
        }
        .padding()
    }
    
    func updateTitleColor() {
        titleColor = isRequired && inputText.isEmpty ? .red : .black
    }
    
    // Title optionally adds a visual/textual indicator that the field is required and must be filled
    private var fieldTitle: some View {
        
        var displayedTitle: String = title
        
        if let last = title.last {
            if isRequired && String(last) != L10n.Strings.requiredFieldSymbol { displayedTitle.append(L10n.Strings.requiredFieldSymbol) }
        }
        
        return Text(displayedTitle)
            .font(.system(.body, design: .default)
                    .weight(.bold))
    }
    private var textField: some View {
        Group {
            if numbersOnly {
                TextField(placeholderText, text: $inputText, onCommit: { updateTitleColor() })
                    .keyboardType(.numberPad)
                    .onReceive(Just(inputText)) { inputValue in
                        let filtered = inputValue.filter { "0123456789".contains($0) }
                        if filtered != inputValue {
                            inputText = filtered
                        }
                    }
            }
            else {
                TextField(placeholderText, text: $inputText, onCommit: { updateTitleColor() })            .disableAutocorrection(LayoutMetrics.disableAutocorrection)
                    .autocapitalization(autocapitalizationType)
            }
        }
        .padding()
        .border(Color(.systemGray6))
        .background(Color(.systemGray5))
        .cornerRadius(LayoutMetrics.cornerRadius)
    }
    
    private enum LayoutMetrics {
        static let disableAutocorrection: Bool = true
        static let cornerRadius: CGFloat = 10
    }
}

struct TextField_Previews: PreviewProvider {
    
    private static let mockTextField: TextFieldView = .fixture()
    private static let mockTextFieldRequired: TextFieldView = .fixtureRequired()
    
    static var previews: some View {
        VStack {
            mockTextField
            mockTextFieldRequired
        }
    }
}
