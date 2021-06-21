//
//  TextFieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var inputText: String = ""
    
    let title: String
    let placeholderText: String
    let isRequired: Bool
    let autocapitalizationType: UITextAutocapitalizationType
    
    var body: some View {
        VStack(alignment: .leading) {
            fieldTitle
            textField
        }
        .padding()
    }
    
    // Title optionally adds a visual/textual indicator that the field is required and must be filled
    private var fieldTitle: some View {
        // TODO: Add verification for doubled asterisks in case `title` already comes with one
        Text(title + (isRequired && title.last! != "*" ? "*" : ""))
            .font(.system(.body, design: .default)
                    .weight(.bold))
    }
    
    private var textField: some View {
        TextField(placeholderText, text: $inputText)
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
