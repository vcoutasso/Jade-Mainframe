//
//  SearchBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: SearchBarViewModel = .init()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField(L10n.searchBarPlaceholderText, text: $viewModel.searchText)
                    .font(.system(.body, design: .default)
                        .weight(.regular))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(LayoutMetrics.defaultPadding)
                    .padding(.leading, LayoutMetrics.searchTextPadding)
                    .overlay(
                        Image(systemName: viewModel.symbolName)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, LayoutMetrics.defaultPadding)
                            .foregroundColor(Color(.systemGray2))
                    )
                    .background(Color(.white))
                    .cornerRadius(LayoutMetrics.cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius)
                        .stroke(Color(.systemGray6), lineWidth: LayoutMetrics.borderWidth))
            }
        }
    }

    private enum LayoutMetrics {
        static let cornerRadius: CGFloat = 10
        static let searchTextPadding: CGFloat = 30
        static let defaultPadding: CGFloat = 10
        static let borderWidth: CGFloat = 2
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
