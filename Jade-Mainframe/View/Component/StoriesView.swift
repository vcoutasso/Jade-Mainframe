//
//  StoriesView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

struct StoriesView: View {
    @ObservedObject var viewModel: StoriesManager

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(viewModel.products) { product in
                        productStoriesView(product: product)
                    }
                    seeMore
                }
            }
        }
    }

    private var seeMore: some View {
        VStack {
            Image(systemName: viewModel.moreSymbolName)
                .font(Font.system(.title2, design: .default)
                    .weight(.bold))
                .foregroundColor(Color(Assets.Colors.moreSymbolBlue.color))
                .frame(width: LayoutMetrics.circleRadius, height: LayoutMetrics.circleRadius)
                .background(Color(.systemGray6))
                .clipShape(Circle())

            Text(verbatim: Strings.moreCategories)
        }
        .padding(LayoutMetrics.allPading)
        .padding(.bottom)
    }

    private func productStoriesView(product: Product) -> some View {
        VStack {
            Image(product.imageName)
                .frame(width: LayoutMetrics.circleRadius, height: LayoutMetrics.circleRadius)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(LinearGradient(
                        gradient: Gradient(colors: [
                            Color(Assets.Colors.storyGradientTop.color),
                            Color(Assets.Colors.storyGradientBottom.color),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    )
                )

            Text(product.productName)
        }
        .padding(LayoutMetrics.allPading)
        .padding(.bottom)
    }

    private enum LayoutMetrics {
        static let allPading: CGFloat = 6
        static let circleRadius: CGFloat = 69
        static let horizontalSpacing: CGFloat = 0
    }
}

struct StoriesView_Previews: PreviewProvider {
    private static let mockProduct: Product = .fixture()

    private static let viewModel: StoriesManager = .init(
        products: [Product](repeating: mockProduct, count: 10)
    )

    static var previews: some View {
        StoriesView(viewModel: viewModel)
    }
}
