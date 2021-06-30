//
//  FavoriteCardView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct FavoriteCardView: View {
    let phoneModel: String
    let phoneSpace: String
    let phonePrice: Double
    var body: some View {
        HStack(spacing: 20) {
            Rectangle().frame(width: LayoutMetrics.cardSize, height: LayoutMetrics.cardSize)
                .cornerRadius(LayoutMetrics.cornerRadius)
                .offset(x: LayoutMetrics.cardOffSet)
            VStack(alignment: .leading, spacing: 10) {
                Text("\(phoneModel) \(phoneSpace)")
                Text("R$\(priceFormatter(price: phonePrice, locale: Strings.locale))")
                HStack {
                    Spacer()
                    heartIcon
                    binocularIconStroke
                }.offset(x: LayoutMetrics.iconsOffSet)
            }.padding(.top)
                .offset(x: LayoutMetrics.cardOffSet)
        }.padding(10)
            .background(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius)
                .frame(width: LayoutMetrics.cardWidth, height: LayoutMetrics.cardHeight, alignment: .center)
                .foregroundColor(Color(.systemGray6)))
            .padding([.leading, .trailing])
    }

    private var binocularIconStroke: some View {
        return Image(systemName: "binoculars")
            .font(.system(size: 22))
            .background(Circle().stroke().frame(width: 38, height: 38, alignment: .center))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var heartIcon: some View {
        return Image(systemName: "heart.circle.fill").font(.system(size: 38))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let cardSize: CGFloat = 115
        static let cornerRadius: CGFloat = 10
        static let cardWidth: CGFloat = 376
        static let cardHeight: CGFloat = 129
        static let cardOffSet: CGFloat = -10
        static let iconsOffSet: CGFloat = 10
        static let cardPadding: CGFloat = 3
    }
}

struct FavoriteCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCardView(phoneModel: "IPhone 12", phoneSpace: "128gb", phonePrice: 1234.00)
    }
}
