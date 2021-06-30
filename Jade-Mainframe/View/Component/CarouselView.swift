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
                        CardView(product: product, locale: viewModel.locale)
                    }
                }
            }
        }
        .padding(.leading, LayoutMetrics.bodyLeadingPadding)
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let titleLineLimit: Int = 1
        static let titleVerticalOffset: CGFloat = 5
        static let horizontalSpacing: CGFloat = 0
        static let bodyLeadingPadding: CGFloat = 10
    }
}

struct CarouselView_Previews: PreviewProvider {
    private static let mockCarousel: Carousel = .fixture()

    private static let mockViewModel: CarouselManager = .init(carousel: mockCarousel, locale: Strings.locale)

    static var previews: some View {
        CarouselView(viewModel: mockViewModel)
    }
}
