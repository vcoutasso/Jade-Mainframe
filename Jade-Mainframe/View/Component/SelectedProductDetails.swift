//
//  SelectedProductDetails.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct SelectedProductDetails: View {
    // MARK: - Variables

    @ObservedObject var viewModel: SelectedProductDetailsManager

    // MARK: - body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                productModelAndPrice.padding(.bottom)
                productDescription.padding(.bottom)
                aboutProduct.padding(.bottom)
                technicalSheet.padding(.bottom)
            }
        }.frame(width: 346)
    }

    // MARK: - Private variables

    private var favoriteIcon: some View {
        return Image(Assets.Images.Icons.heart.name).font(.system(size: 38))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var productModelAndPrice: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(viewModel.product.model!) (amz)").font(TecoFonts.titleSelectedProductFont)
                Spacer()
                favoriteIcon.offset(x: -10)
            }
            VStack(alignment: .leading) {
                Text("""
                \(priceFormatter(price: viewModel.product.price! - viewModel.product.discount!,
                                 locale: Strings.locale))
                """)
                    .strikethrough()
                    .foregroundColor(Color(Assets
                            .Colors
                            .TecoPalette
                            .mediumDarkGray
                            .color))
                    .font(TecoFonts.discountSelectedProductFont)
                Text("\(priceFormatter(price: viewModel.product.price!, locale: Strings.locale))")
                    .font(TecoFonts.priceSelectedProductFont)
            }
        }
    }

    private var productDescription: some View {
        VStack(alignment: .leading) {
            Text("Descrição").font(TecoFonts.subTitleSelectedProductFont)

            // precisa colocar este parametro no Product
            Text("innjnkj").foregroundColor(Color(Assets
                    .Colors
                    .TecoPalette
                    .mediumGray
                    .color))
                                .font(TecoFonts.descriptionSelectedProductFont)
        }
    }

    private var aboutProduct: some View {
        let lines: [IconAndText] = [
            IconAndText(systemName: "clock.arrow.circlepath", text: "Tempo de uso:"),
            IconAndText(systemName: "doc.text", text: "Nota fiscal:"),
            IconAndText(systemName: "airpodspro", text: "Acessórios:"),
        ]
        return VStack(alignment: .leading, spacing: 0) {
            Text("Sobre este aparelho")
                .font(TecoFonts.subTitleSelectedProductFont)
            ForEach(lines) { line in
                HStack(spacing: 5) {
                    VStack {
                        Image(systemName: line.systemName)
                            .frame(width: 25, height: 30, alignment: .center)
                            .foregroundColor(Color(Assets
                                    .Colors
                                    .TecoPalette.mediumDarkGray
                                    .color))
                    }
                    VStack(alignment: .leading) {
                        Text(line.text)
                            .foregroundColor(Color(Assets
                                    .Colors
                                    .TecoPalette.mediumDarkGray
                                    .color))
                            .font(TecoFonts.lineSelectedProductFont)
                    }
                }
            }
            HStack {
                Image(Assets.Images.Icons.iphoneScreen.name).frame(width: 25, height: 30, alignment: .center)
                Text("Precisando troca de tela:")
                    .foregroundColor(Color(Assets
                            .Colors
                            .TecoPalette.mediumDarkGray
                            .color))
                    .font(TecoFonts.lineSelectedProductFont)
            }
        }
    }

    private var technicalSheet: some View {
        let lines: [IconAndText] = [
            IconAndText(systemName: "clock.arrow.circlepath", text: "Tempo de uso:"),
            IconAndText(systemName: "doc.text", text: "Nota fiscal:"),
            IconAndText(systemName: "cpu", text: "Memória interna:"),
            IconAndText(systemName: "cpu", text: "Memória RAM:"),
        ]
        return VStack(alignment: .leading) {
            Text("Sobre este aparelho")
            ForEach(lines) { line in
                HStack(spacing: 5) {
                    VStack {
                        Image(systemName: line.systemName)
                            .frame(width: 25, height: 30, alignment: .center)
                            .foregroundColor(Color(Assets
                                    .Colors
                                    .TecoPalette
                                    .mediumDarkGray
                                    .color))
                    }
                    VStack(alignment: .leading) {
                        Text(line.text)
                            .foregroundColor(Color(Assets
                                    .Colors
                                    .TecoPalette.mediumDarkGray
                                    .color))
                            .font(TecoFonts.lineSelectedProductFont)
                    }
                }
            }
        }
    }

    // MARK: - Struct

    struct IconAndText: Identifiable {
        var id = UUID()
        let systemName: String
        let text: String
    }

    struct SelectedProductDetails_Previews: PreviewProvider {
        private static let mockViewModel: SelectedProductDetailsManager = .init(product: .fixtureDiscount())
        static var previews: some View {
            SelectedProductDetails(viewModel: mockViewModel)
        }
    }
}
