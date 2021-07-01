//
//  CardView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import SwiftUI

struct CardView: View {
    // MARK: - Variable

    let product: Product
    let locale: String

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(uiImage: product.images?.first ?? UIImage(named: "Images/12")!)
                .frame(width: LayoutMetrics.miniProductWidth, height: LayoutMetrics.miniProductHeight)
                .background(Color(.systemGray6))
                .cornerRadius(LayoutMetrics.innerCornerRadius)

            VStack(alignment: .leading) {
                Text(product.model!)
                    .font(.caption)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumLightGray.color))

                if product.discount! > 0 {
                    Text("""
                    \(Strings.currencySymbol) \
                    \(priceFormatter(price: product.price!, locale: locale))
                    """)
                        .font(Font.system(size: LayoutMetrics.oldPriceSize, weight: .regular, design: .default))
                        .strikethrough()
                        .foregroundColor(Color(Assets.Colors.TecoPalette.discountRed.color))
                }

                Text("""
                \(Strings.currencySymbol) \
                \(priceFormatter(price: product.price! - product.discount!, locale: locale))
                """)
                    .font(.subheadline)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.darkGray.color))
            }
        }
        .padding(LayoutMetrics.cardAllPadding)
        .background(
            RoundedRectangle(cornerRadius: LayoutMetrics.outerCornerRadius)
                .foregroundColor(.white)
                .shadow(radius: LayoutMetrics.shadowRadius,
                        x: LayoutMetrics.shadowOffset,
                        y: LayoutMetrics.shadowOffset)
        )
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let miniProductWidth: CGFloat = 135
        static let miniProductHeight: CGFloat = 110
        static let miniCardWidth: CGFloat = 145
        static let miniCardHeight: CGFloat = 184
        static let outerCornerRadius: CGFloat = 5
        static let innerCornerRadius: CGFloat = 5
        static let shadowRadius: CGFloat = 1
        static let shadowOffset: CGFloat = 1
        static let cardAllPadding: CGFloat = 6
        static let oldPriceSize: CGFloat = 8
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(product: .fixture(), locale: Strings.locale)
            CardView(product: .fixtureDiscount(), locale: Strings.locale)
        }
    }
}
