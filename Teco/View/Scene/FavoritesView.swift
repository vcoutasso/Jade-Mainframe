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
        VStack {
            // REVIEW: What is down huddle?
            ForEach(userFavorites.favorites) { favorite in
                FavoriteCardView(viewModel: .init(favorite: favorite))
            }
            downHuddle
            Spacer()
        }
    }

    private var downHuddle: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text(Strings.watchList)
                    .padding(.bottom, 5)
                    .foregroundColor(Color(.darkGray))
                VStack {
                    HStack {
                        binocularIconFill
                        Text("""
                        \(Strings.callToTheWatchList) \
                        \(Text(Strings.readMore)
                            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color)))
                        """)
                            .lineLimit(3)
                    }
                    addButtom
                }
            }
            Spacer()
        }
    }

    // MARK: - Private view variables

    private var binocularIconStroke: some View {
        return Image(systemName: viewModel.watchListSymbolName)
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

    private var addButtom: some View {
        return Text(Strings.addProducts)
            .fontWeight(.semibold)
            .padding()
            .padding([.leading, .trailing], 10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color)).padding(.top)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    private static var mockModel: FavoritesManager = .init(favoritedItems: [.fixture(), .fixtureWatched()])

    static var previews: some View {
        FavoritesView(viewModel: mockModel)
    }
}
