//
//  FieldView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 18/06/21.
//

import Combine
import SwiftUI

struct FieldView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: FieldManager

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            fieldTitle
                .foregroundColor(viewModel.field.titleColor)
            textField
        }
        .padding()
    }

    // MARK: - Private Views

    private var fieldTitle: some View {
        Text(viewModel.displayedTitle)
            .font(Font.system(.body, design: .default)
                .weight(.bold))
    }

    private var textField: some View {
        Group {
            if viewModel.field.style == .price {
                TextField(viewModel.field.placeholderText,
                          text: $viewModel.field.inputText,
                          onCommit: viewModel.handleTitleColor)
                    .keyboardType(.numberPad)
                    .onReceive(Just(viewModel.field.inputText), perform: viewModel.handleTextReceive)
            } else {
                TextField(viewModel.field.placeholderText,
                          text: $viewModel.field.inputText,
                          onCommit: viewModel.handleTitleColor)
                    .disableAutocorrection(LayoutMetrics.disableAutocorrection)
                    .autocapitalization(viewModel.field.autocapitalizationType)
            }
        }
        .padding()
        .border(Color(.systemGray6))
        .background(Color(.systemGray5))
        .cornerRadius(LayoutMetrics.cornerRadius)
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let disableAutocorrection: Bool = true
        static let cornerRadius: CGFloat = 10
    }
}

struct TextField_Previews: PreviewProvider {
    private static let mockField: Field = .fixture()
    private static let mockViewModel: FieldManager = .init(
        title: mockField.title,
        placeholderText: mockField.placeholderText,
        isRequired: mockField.isRequired,
        style: mockField.style
    )

    private static let mockPriceField: Field = .fixturePrice()
    private static let mockPriceViewModel: FieldManager = .init(
        title: mockPriceField.title,
        placeholderText: mockPriceField.placeholderText,
        isRequired: mockPriceField.isRequired,
        style: mockPriceField.style
    )

    static var previews: some View {
        VStack {
            FieldView(viewModel: mockViewModel)
            FieldView(viewModel: mockPriceViewModel)
        }
    }
}
