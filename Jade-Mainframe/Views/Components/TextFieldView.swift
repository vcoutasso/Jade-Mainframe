//
//  TextFieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import Combine
import SwiftUI

struct TextFieldView: View {
    @ObservedObject var viewModel: TextFieldViewModel

    var body: some View {
        VStack(alignment: .leading) {
            fieldTitle
                .foregroundColor(viewModel.titleColor)
            textField
        }
        .padding()
    }

    private var fieldTitle: some View {
        Text(viewModel.displayedTitle)
            .font(.system(.body, design: .default)
                .weight(.bold))
    }

    private var textField: some View {
        Group {
            if viewModel.numbersOnly {
                TextField(viewModel.placeholderText,
                          text: $viewModel.inputText,
                          onCommit: viewModel.handleTitleColor)
                    .keyboardType(.numberPad)
                    .onReceive(Just(viewModel.inputText), perform: viewModel.handleTextReceive)
            } else {
                TextField(viewModel.placeholderText, text: $viewModel.inputText, onCommit: { viewModel.handleTitleColor() }).disableAutocorrection(LayoutMetrics.disableAutocorrection)
                    .autocapitalization(viewModel.autocapitalizationType)
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
    private static let mockViewModel: TextFieldViewModel = .fixture()
    private static let mockRequiredViewModel: TextFieldViewModel = .fixtureRequired()

    static var previews: some View {
        VStack {
            TextFieldView(viewModel: mockViewModel)
            TextFieldView(viewModel: mockRequiredViewModel)
        }
    }
}
