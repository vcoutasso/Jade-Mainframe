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
            }.padding(.trailing, 70)
        }
    }

    // MARK: - Private variables

    private var favoriteIcon: some View {
        return Image(Assets.Images.Icons.heart.name).font(.system(size: 38))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var productModelAndPrice: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(viewModel.product.productName) (armazenamento)")
                favoriteIcon
            }
            VStack(alignment: .leading) {
                Text("\(priceFormatter(price: viewModel.product.productPrice - viewModel.product.productDiscount, locale: Strings.locale))")
                    .strikethrough()
                    .foregroundColor(Color(Assets
                            .Colors
                            .TecoPalette
                            .mediumDarkGray
                            .color))
                Text("\(priceFormatter(price: viewModel.product.productPrice, locale: Strings.locale))")
            }
        }
    }

    private var productDescription: some View {
        VStack(alignment: .leading) {
            Text("Descrição")
            Text("blabljhbhjkl \n hba").foregroundColor(Color(Assets
                    .Colors
                    .TecoPalette
                    .mediumGray
                    .color)) // precisa colocar este parametro no Product
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
