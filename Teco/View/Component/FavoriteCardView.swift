//
//  FavoriteCardView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct FavoriteCardView: View {
    @EnvironmentObject var userFavorites: FavoritesData

    @ObservedObject var viewModel: FavoriteCardManager

    @State var isLinkActive = false

    var body: some View {
        HStack(spacing: 20) {
            Image(uiImage: viewModel.item.product.images!.first!)
                .resizable()
                .scaledToFill()
                .frame(width: LayoutMetrics.cardSize, height: LayoutMetrics.cardSize)
                .cornerRadius(LayoutMetrics.cornerRadius)
                .offset(x: LayoutMetrics.cardOffSet)

            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.item.announcementName)
                Text("""
                \(Strings.currencySymbol) \
                \(priceFormatter(price: viewModel.item.productPrice,
                                 locale: Strings.locale))
                """)
                HStack {
                    Spacer()

                    Button(action: {
                               viewModel.handleFavoriteToggle(userFavorites: userFavorites)
                           },
                           label: {
                               Image(viewModel.heartImageName)
                           })

                    NavigationLink(destination: AddDesiredProductsView(), isActive: $isLinkActive) {
                        Button(action: {
                                   viewModel.handleBinocularToggle()
                                   isLinkActive = viewModel.isWatched ? true : false
                               },
                               label: {
                                   Image(uiImage: viewModel.isWatched ? Assets.Images.Icons.filledBinoculars.image : Assets.Images.Icons.binoculars.image)
                               })
                    }
                }
                .offset(x: LayoutMetrics.iconsOffSet)
            }
            .padding(.top)
            .offset(x: LayoutMetrics.cardOffSet)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius)
            .frame(width: LayoutMetrics.cardWidth, height: LayoutMetrics.cardHeight, alignment: .center)
            .foregroundColor(Color(.systemGray6)))
        .padding([.leading, .trailing])
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
        FavoriteCardView(viewModel: .init(favorite: .fixture()))
    }
}
