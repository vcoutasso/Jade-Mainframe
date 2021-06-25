//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var viewModel: CarouselViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.categoryTitle)
                .font(.body)
                .fontWeight(.medium)
                .lineLimit(1)
                .offset(y: 5)

            ScrollView(.horizontal) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(viewModel.products) { product in
                        productMiniView(product: product)
                    }
                }
            }
        }.padding(.leading, 10)
    }

    private func productMiniView(product: Product) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.white))
                .frame(width: LayoutMetrics.miniCardWidth, height: LayoutMetrics.miniCardHeight)
                .cornerRadius(10)
                .shadow(radius: 2, x: 2, y: 2)
                .padding(6)

            VStack(alignment: .leading, spacing: 0) {
                Image(product.imageName)
                    .frame(width: LayoutMetrics.miniProductWidth, height: LayoutMetrics.miniProductHeight)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)

                VStack(alignment: .leading) {
                    Text(product.productName).font(.footnote)
                        .foregroundColor(Color(.systemGray2))
                    Text("\(L10n.currencySymbol) \(viewModel.formattedPrice(value: product.productPrice))")
                        .font(.callout)
                        .foregroundColor(.black)
                }
            }
        }
    }

    private enum LayoutMetrics {
        static let horizontalSpacing: CGFloat = 0
        static let miniProductWidth: CGFloat = 135
        static let miniProductHeight: CGFloat = 82
        static let miniCardWidth: CGFloat = 146
        static let miniCardHeight: CGFloat = 129
    }
}

struct CarouselView_Previews: PreviewProvider {
    private static let mockProduct: Product = .fixture()

    private static let viewModel: CarouselViewModel = .init(
        products: [Product](repeating: mockProduct, count: 10),
        categoryTitle: "Adicionados Recentemente"
    )

    static var previews: some View {
        CarouselView(viewModel: viewModel)
    }
}
