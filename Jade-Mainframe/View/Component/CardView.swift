//
//  CardView.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import SwiftUI

struct CardView: View {
    let product: Product
    let locale: String

    // MARK: - Body

    var body: some View {
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

                    if product.discount > 0 {
                        Text("""
                        \(Strings.currencySymbol) \
                        \(priceFormatter(price: product.productPrice - product.discount, locale: locale))
                        """)
                            .font(.caption2)
                            .strikethrough()
                            .foregroundColor(.red)
                    }

                    Text("""
                    \(Strings.currencySymbol) \
                    \(priceFormatter(price: product.productPrice - product.discount, locale: locale))
                    """)
                        .font(.callout)
                        .foregroundColor(.black)
                }
            }
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let miniProductWidth: CGFloat = 135
        static let miniProductHeight: CGFloat = 82
        static let miniCardWidth: CGFloat = 146
        static let miniCardHeight: CGFloat = 129
        static let cornerRadiusBig: CGFloat = 10
        static let cornerRadiusSmall: CGFloat = 5
        static let shadowRadius: CGFloat = 2
        static let shadowOffset: CGFloat = 2
        static let cardAllPadding: CGFloat = 6
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(product: .fixture(), locale: Strings.locale)
    }
}
