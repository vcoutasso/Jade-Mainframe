//
//  SearchBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: SearchBarManager

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            TextField(Strings.searchBarPlaceholderText, text: $viewModel.searchBar.searchText)
                .font(Font.system(.body, design: .default)
                    .weight(.regular))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(LayoutMetrics.allPadding)
                .padding(.leading, LayoutMetrics.searchTextPadding - LayoutMetrics.allPadding)
                .overlay(
                    Image(systemName: viewModel.symbolName)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, LayoutMetrics.iconPadding)
                )
                .background(Color(.white))
                .cornerRadius(LayoutMetrics.cornerRadius)
                .frame(width: LayoutMetrics.frameWidth, height: LayoutMetrics.frameHeight, alignment: .center)
                .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let frameWidth: CGFloat = 362
        static let frameHeight: CGFloat = 34
        static let cornerRadius: CGFloat = 10
        static let searchTextPadding: CGFloat = 38
        static let allPadding: CGFloat = 10
        static let iconPadding: CGFloat = 9
        static let horizontalPadding: CGFloat = 14
    }
}

struct SearchBarView_Previews: PreviewProvider {
    private static let mockViewModel: SearchBarManager = .init()

    static var previews: some View {
        SearchBarView(viewModel: mockViewModel)
    }
}
