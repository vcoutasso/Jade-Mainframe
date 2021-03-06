//
//  SelectedProductDetails.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct TutorialModal: View {
    @Environment(\.presentationMode) var presentationMode

    @State var currentIndex = 0

    let images: [String] = [
        Assets.Images.Splash.modalFavorites.name,
        Assets.Images.Splash.modalWatchlist.name,
    ]

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0 ..< images.count) { idx in
                Image(images[idx])
//                    .resizable()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color(.gray))
                    .ignoresSafeArea(.all)
                    .tag(idx)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ProductPageInfoView: View {
    // MARK: - Variables

    @EnvironmentObject var userFavorites: FavoritesData

    @AppStorage("showTutorial") var showTutorial: Bool?

    @ObservedObject var viewModel: ProductPageManager

    @State private var isPresented = false

    var profile: Profile = .init(name: "Joãozinho Pedro", email: "", location: "Curitiba, PR")

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
            seller
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
                    if showTutorial ?? true {
                        isPresented.toggle()
                        showTutorial = false
                    }
                }, label: {
                    favoriteIcon
                        .padding(.trailing)
                })
                    .fullScreenCover(isPresented: $isPresented, content: TutorialModal.init)
            }

            VStack(alignment: .leading) {
                Text("\(priceFormatter(price: product.price! - (product.discount ?? 0)!, locale: Strings.locale))")
                    .strikethrough()
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumDarkGray.color))
                    .font(TecoFonts.discountSelectedProductFont)
                    .opacity((product.discount ?? 0) > 0 ? 1 : 0)

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

    private var seller: some View {
        VStack(alignment: .leading) {
            Text(Strings.seller)

            HStack {
                Image("Images/Icons/avatar")
                    .frame(width: 58, height: 58)

                VStack(alignment: .leading) {
                    Text(profile.name)

                    Text(profile.location)
                }

                Spacer()

                Text("Ver perfil")
                    .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
            }
            .padding([.leading, .trailing])
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(Color(Assets.Colors.TecoPalette.lightGray.color))
                .frame(width: 350, height: 78, alignment: .center)
                .foregroundColor(.white)
            )
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
