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
        ForEach(viewModel.carousels) { carousel in
            VStack(alignment: .leading) {
                Text(carousel.categoryTitle)
                    .font(.body)
                    .fontWeight(.medium)
                    .lineLimit(LayoutMetrics.titleLineLimit)
                    .offset(y: LayoutMetrics.titleVerticalOffset)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: LayoutMetrics.horizontalSpacing) {
                        ForEach(carousel.products) { product in
                            NavigationLink(destination: ProductPageView(viewModel: .init(product: product)), label: {
                                CardView(product: product, locale: viewModel.locale)
                                    .padding(LayoutMetrics.cardPadding)
                            })
                        }
                    }
                }
            }
            .padding(.leading, LayoutMetrics.bodyLeadingPadding)
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let titleLineLimit: Int = 1
        static let titleVerticalOffset: CGFloat = 5
        static let horizontalSpacing: CGFloat = 0
        static let bodyLeadingPadding: CGFloat = 10
        static let cardPadding: CGFloat = 3
    }
}

struct CarouselView_Previews: PreviewProvider {
    private static let mockViewModel: CarouselManager = .init(
        carousels: [.fixture(), .fixtureDiscount()],
        locale: Strings.locale
    )

    static var previews: some View {
        CarouselView(viewModel: mockViewModel)
    }
}
