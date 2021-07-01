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
        VStack(alignment: .leading) {
            Text("Sobre este aparelho")
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                Text("Tempo de uso:")
            }
            HStack {
                Image(systemName: "doc.text")
                Text("Nota fiscal:")
            }
            HStack {
                Image(systemName: "airpodspro")
                Text("Acessórios:")
            }
            HStack {
                Image(systemName: "iphone")
                Text("Precisando troca de tela:")
            }
        }
    }

    private var technicalSheet: some View {
        VStack(alignment: .leading) {
            Text("Ficha Técnica")
            HStack {
                Image(systemName: "camera")
                Text("Câmera traseira:")
            }
            HStack {
                Image(systemName: "camera")
                Text("Câmera frontal:")
            }
            HStack {
                Image(systemName: "cpu")
                Text("Memória interna:")
            }
            HStack {
                Image(systemName: "cpu")
                Text("Memória RAM:")
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
