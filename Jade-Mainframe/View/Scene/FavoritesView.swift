//
//  FavoritesView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct FavoritesView: View {
    // MARK: - Body

    var body: some View {
        VStack {
            downHuddle
        }
    }

    private var downHuddle: some View {
        VStack(alignment: .leading) {
            Text("ficar de olho").padding(.bottom, 5)
                .foregroundColor(Color(.darkGray))
            VStack {
                HStack {
                    binocularIconFill
                    Text("Cansado de procurar?\nA gente ficra de olho e te avisa\nquando achar. \(Text("Saiba mais").foregroundColor(Color(Assets.Colors.moreSymbolBlue.color)))")
                }
                addButtom
            }
        }
    }

    // MARK: - Private view variables

    private var binocularIconStroke: some View {
        return Image(systemName: "binoculars").padding(10)
            .overlay(Circle().stroke())
            .foregroundColor(Color(Assets.Colors.moreSymbolBlue.color))
    }

    private var binocularIconFill: some View {
        ZStack {
            Image(systemName: "binoculars")
                .font(.largeTitle)
                .padding(20)
                .foregroundColor(.white)
                .background(Circle()
                    .fill(Color(Assets.Colors.moreSymbolBlue.color)))
        }
    }

    private var addButtom: some View {
        return Text("Adicionar produtos desejados")
            .fontWeight(.semibold)
            .padding()
            .padding([.leading, .trailing], 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            .foregroundColor(Color(Assets.Colors.moreSymbolBlue.color)).padding(.top)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
