//
//  SelectedProductDetails.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct ProductPageInfoView: View {
    // MARK: - Variables

    @EnvironmentObject var userFavorites: FavoritesData

    @ObservedObject var viewModel: ProductPageManager

    var product: Product {
        viewModel.product
    }

    // MARK: - body

    var body: some View {
        VStack(alignment: .leading) {
            header
                .padding(.bottom)
            productDescription
                .padding(.bottom)
            aboutProduct
                .padding(.bottom)
            technicalSheet
                .padding(.bottom)
        }
        .padding([.leading, .trailing])
    }

    // MARK: - Private variables

    private var favoriteIcon: some View {
        Image(viewModel.isFavorite ? Assets.Images.Icons.filledHeart.name : Assets.Images.Icons.heart.name)
    }

    private var header: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(product.model!) \(product.memory!)")
                    .font(TecoFonts.titleSelectedProductFont)

                Spacer()

                Button(action: {
                    viewModel.handleFavoriteToggle(userFavorites: userFavorites)
                }, label: {
                    favoriteIcon
                        .padding(.trailing)
                })
            }

            VStack(alignment: .leading) {
                Text("\(priceFormatter(price: product.price! - (product.discount ?? 0)!, locale: Strings.locale))")
                    .strikethrough()
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))
                    .font(TecoFonts.discountSelectedProductFont)
                    .opacity(product.discount ?? 0 > 0 ? 0 : 1)

                Text("\(priceFormatter(price: product.price!, locale: Strings.locale))")
                    .font(TecoFonts.priceSelectedProductFont)
            }
        }
    }

    private var productDescription: some View {
        VStack(alignment: .leading) {
            Text(Strings.description)
                .font(TecoFonts.subTitleSelectedProductFont)

            Text(product.description ?? "\n\n")
                .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
                .font(TecoFonts.descriptionSelectedProductFont)
        }
    }

    private func rowView(icon: String, title: String, text: String) -> some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .frame(width: 25, height: 30, alignment: .center)
                .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))

            if !title.isEmpty {
                Text(title)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))
                    .font(TecoFonts.lineSelectedProductFont)
                    .frame(alignment: .leading)
            }

            Text(text)
                .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))
                .font(TecoFonts.lineSelectedProductFont)
                .frame(alignment: .leading)
                .lineLimit(1)
        }
    }

    private var aboutProduct: some View {
        VStack(alignment: .leading) {
            Text(Strings.aboutProduct)

            rowView(icon: "clock.arrow.circlepath", title: "Tempo de uso:", text: product.useTime ?? "")
            rowView(icon: "doc.text", title: "Nota fiscal:", text: product.invoice ?? "")
            rowView(icon: "earpods", title: "Acesssórios:", text: product.acessories ?? "Não")
            rowView(icon: "iphone", title: "", text: product.screenState ?? "")
        }
    }

    private var technicalSheet: some View {
        VStack(alignment: .leading) {
            Text(Strings.technicalSheet)

            rowView(icon: "camera", title: "Câmera traseira:", text: product.backCamera ?? "")
            rowView(icon: "camera", title: "Câmera frontal:", text: product.frontalCamera ?? "")
            rowView(icon: "cpu", title: "Memória interna", text: product.memory ?? "")
            rowView(icon: "cpu", title: "Memória RAM:", text: product.memoryRAM ?? "")
        }
    }

    // MARK: - Struct

    struct IconAndText: Identifiable {
        var id = UUID()
        let systemName: String
        let text: String
    }

    // MARK: - LayoutMetrics

    private enum LayoutMetrics {
        static let iconSize: CGFloat = 38
    }
}

struct SelectedProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductPageInfoView(viewModel: .init(product: .fixture()))
    }
}
