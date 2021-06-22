//
//  TextFieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var inputText: String = ""
    @State private var foregroundColor: Color = .black
    
    let title: String
    let placeholderText: String
    let isRequired: Bool
    let autocapitalizationType: UITextAutocapitalizationType
    
    var body: some View {
        VStack(alignment: .leading) {
            fieldTitle
                .foregroundColor(foregroundColor)
            textField
        }
        .padding()
    }
    
    func updateTitleColor() {
        foregroundColor = isRequired && inputText.isEmpty ? .red : .black
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
        TextField(placeholderText, text: $inputText, onCommit: { updateTitleColor() })
            .disableAutocorrection(LayoutMetrics.disableAutocorrection)
            .autocapitalization(autocapitalizationType)
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
