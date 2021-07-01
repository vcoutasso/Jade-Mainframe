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
            ZStack {
                Image("")
                    .frame(width: LayoutMetrics.circleDiameter, height: LayoutMetrics.circleDiameter)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())

                Image(systemName: viewModel.moreSymbolName)
                    .font(Font.system(.title2, design: .default)
                        .weight(.bold))
                    .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
            }

            descriptionView(text: Strings.moreCategories)
        }
        .padding(LayoutMetrics.allPading)
        .padding(.bottom)
    }

    private func productStoriesView(product: Product) -> some View {
        VStack {
            Image(uiImage: product.images?.first ?? UIImage(named: "Images/12")!)
                .frame(width: LayoutMetrics.circleDiameter, height: LayoutMetrics.circleDiameter)
                .background(Color(.white))
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(LinearGradient(
                        gradient: Gradient(colors: [
                            Color(Assets.Colors.storyGradientTop.color),
                            Color(Assets.Colors.storyGradientBottom.color),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: LayoutMetrics.strokeLineWidth)
                )

            descriptionView(text: product.model!)
        }
        .padding(LayoutMetrics.allPading)
        .padding(.bottom)
    }

    private func descriptionView(text: String) -> some View {
        Text(text)
            .font(Font.system(.caption2, design: .default)
                .weight(.regular))
            .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))
    }

    private enum LayoutMetrics {
        static let allPading: CGFloat = 6
        static let circleDiameter: CGFloat = 69
        static let strokeLineWidth: CGFloat = 2
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
