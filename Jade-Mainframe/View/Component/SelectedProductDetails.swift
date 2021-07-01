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

    private var favoriteIcon: some View {
        return Image(systemName: "heart.circle").font(.system(size: 38))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var productModelAndPrice: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(viewModel.product.productName) (armazenamento)")
                favoriteIcon
            }
            VStack(alignment: .leading) {
                Text("\(priceFormatter(price: viewModel.product.productDiscount, locale: Strings.locale))")
                Text("\(priceFormatter(price: viewModel.product.productPrice, locale: Strings.locale))")
            }
        }
    }

    private var productDescription: some View {
        VStack(alignment: .leading) {
            Text("Descrição")
            Text("blabla") // precisa colocar este parametro no Product
        }
    }

    private var aboutProduct: some View {
        let lines: [IconAndText] = [IconAndText(systemName: "clock.arrow.circlepath", text: "Tempo de uso:"),
                                    IconAndText(systemName: "doc.text", text: "Nota fiscal:"),
                                    IconAndText(systemName: "airpodspro", text: "Acessórios:"),
                                    IconAndText(systemName: "iphone", text: "Precisando troca de tela:")]
        return VStack(alignment: .leading) {
            Text("Sobre este aparelho")
            ForEach(lines) { line in
                HStack(spacing: 5) {
                    VStack {
                        Image(systemName: line.systemName).frame(width: 25, height: 30, alignment: .center)
                    }
                    VStack(alignment: .leading) {
                        Text(line.text)
                    }
                }
            }
        }
    }

    private var technicalSheet: some View {
        let lines: [IconAndText] = [IconAndText(systemName: "clock.arrow.circlepath", text: "Tempo de uso:"),
                                    IconAndText(systemName: "doc.text", text: "Nota fiscal:"),
                                    IconAndText(systemName: "cpu", text: "Memória interna:"),
                                    IconAndText(systemName: "cpu", text: "Memória RAM:")]
        return VStack(alignment: .leading) {
            Text("Sobre este aparelho")
            ForEach(lines) { line in
                HStack(spacing: 5) {
                    VStack {
                        Image(systemName: line.systemName).frame(width: 25, height: 30, alignment: .center)
                    }
                    VStack(alignment: .leading) {
                        Text(line.text)
                    }
                }
            }
        }
    }

    struct SelectedProductDetails_Previews: PreviewProvider {
        private static let mockViewModel: SelectedProductDetailsManager = .init(product: .fixtureDiscount())
        static var previews: some View {
            SelectedProductDetails(viewModel: mockViewModel)
        }
    }
}

struct IconAndText: Identifiable {
    var id = UUID()
    let systemName: String
    let text: String
}
