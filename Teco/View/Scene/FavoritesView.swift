//
//  FavoritesView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var userFavorites: FavoritesData

    @ObservedObject var viewModel: FavoritesManager

    // MARK: - Body

    var body: some View {
        NavigationView {
            ScrollView {
                // REVIEW: What is down huddle?
                ForEach(userFavorites.favorites) { favorite in
                    NavigationLink(destination: ProductPageView(
                        viewModel: .init(product: favorite.product, isFavorite: true)),
                    label: {
                        FavoriteCardView(viewModel: .init(favorite: favorite))
                    })
                }
                downHuddle
                Spacer()
            }
            .navigationTitle(Strings.goBack)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }

    private var downHuddle: some View {
        VStack(alignment: .leading) {
            Text(Strings.watchList)
                .padding([.top, .bottom], 10)
                .foregroundColor(Color(.darkGray))
            VStack {
                HStack {
                    binocularIconFill
                    Text("""
                    \(Strings.callToTheWatchList) \
                    \(Text(Strings.readMore).font(TecoFonts.readMore)
                        .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color)))
                    """).font(TecoFonts.callToWatchList)
                        .lineLimit(3)
                }
                NavigationLink(destination: AddDesiredProductsView()) {
                    addButton
                }
            }
        }
        .padding()
    }

    // MARK: - Private view variables

    private var binocularIconStroke: some View {
        Image(systemName: viewModel.watchListSymbolName)
            .padding(10)
            .overlay(Circle()
                .stroke())
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var binocularIconFill: some View {
        ZStack {
            Image(systemName: viewModel.watchListSymbolName)
                .font(.largeTitle)
                .padding(20)
                .foregroundColor(.white)
                .background(Circle()
                    .fill(Color(Assets.Colors.TecoPalette.darkBlue.color)))
        }
    }

    private var addButton: some View {
        Text(Strings.addProducts)
            .fontWeight(.semibold)
            .padding()
            .padding([.leading, .trailing], 10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color)).padding(.top, 20)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    private static var mockModel: FavoritesManager = .init(favoritedItems: [.fixture(), .fixtureWatched()])

    static var previews: some View {
        FavoritesView(viewModel: mockModel)
    }
}
