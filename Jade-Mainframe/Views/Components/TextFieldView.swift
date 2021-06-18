//
//  TextFieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var inputText: String = ""
    
    var title: String
    var placeholderText: String
    let isRequired: Bool = false
    let autocapitalizationType: UITextAutocapitalizationType = .none
    
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
        Text(title + (isRequired ? "*" : ""))
            .font(.system(.body, design: .default)
                    .weight(.bold))
    }
    
    private var textField: some View {
        TextField(placeholderText, text: $inputText)
            .disableAutocorrection(true)
            .autocapitalization(autocapitalizationType)
            .padding()
            .border(Color(.systemGray6))
            .background(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Title", placeholderText: "Placeholder text")
    }
}
