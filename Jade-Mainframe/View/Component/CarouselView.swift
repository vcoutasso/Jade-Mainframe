//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

struct CarouselView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: CarouselManager

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.carousel.categoryTitle)
                .font(.body)
                .fontWeight(.medium)
                .lineLimit(LayoutMetrics.titleLineLimit)
                .offset(y: LayoutMetrics.titleVerticalOffset)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(viewModel.carousel.products) { product in
                        productCardView(product: product)
                    }
                }
            }
        }
        .padding(.leading, LayoutMetrics.bodyLeadingPadding)
    }

    // MARK: - Private methods

    private func productCardView(product: Product) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.white))
                .frame(width: LayoutMetrics.miniCardWidth, height: LayoutMetrics.miniCardHeight)
                .cornerRadius(LayoutMetrics.cornerRadiusBig)
                .shadow(radius: LayoutMetrics.shadowRadius,
                        x: LayoutMetrics.shadowOffset,
                        y: LayoutMetrics.shadowOffset)
                .padding(LayoutMetrics.cardAllPadding)

            VStack(alignment: .leading, spacing: 0) {
                Image(product.imageName)
                    .frame(width: LayoutMetrics.miniProductWidth, height: LayoutMetrics.miniProductHeight)
                    .background(Color(.systemGray6))
                    .cornerRadius(LayoutMetrics.cornerRadiusSmall)

                VStack(alignment: .leading) {
                    Text(product.productName).font(.footnote)
                        .foregroundColor(Color(.systemGray2))
                    Text("\(Strings.currencySymbol) \(viewModel.formattedPrice(value: product.productPrice))")
                        .font(.callout)
                        .foregroundColor(.black)
                }
            }
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let titleLineLimit: Int = 1
        static let titleVerticalOffset: CGFloat = 5
        static let horizontalSpacing: CGFloat = 0
        static let miniProductWidth: CGFloat = 135
        static let miniProductHeight: CGFloat = 82
        static let miniCardWidth: CGFloat = 146
        static let miniCardHeight: CGFloat = 129
        static let cornerRadiusBig: CGFloat = 10
        static let cornerRadiusSmall: CGFloat = 5
        static let bodyLeadingPadding: CGFloat = 10
        static let cardAllPadding: CGFloat = 6
        static let shadowRadius: CGFloat = 2
        static let shadowOffset: CGFloat = 2
    }
}

struct CarouselView_Previews: PreviewProvider {
    private static let mockCarousel: Carousel = .fixture()

    private static let mockViewModel: CarouselManager = .init(carousel: mockCarousel, locale: Strings.locale)

    static var previews: some View {
        CarouselView(viewModel: mockViewModel)
    }
}
