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
            ScrollView(.horizontal) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(viewModel.products) { product in
                        productStoriesView(product: product)
                    }
                }
            }
        }
    }

    private func productStoriesView(product: Product) -> some View {
        VStack {
            Image(product.imageName).frame(width: LayoutMetrics.circleRadius, height: LayoutMetrics.circleRadius)
                .background(Color(.systemGray6))
                .clipShape(Circle())

            Text(product.productName)

        }.padding(6)
            .padding(.bottom)
    }

    private enum LayoutMetrics {
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
