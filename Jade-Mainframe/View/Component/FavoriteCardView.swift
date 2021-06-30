//
//  FavoriteCardView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct FavoriteCardView: View {
    let phoneModel: String
    let phoneSpace: String
    let phonePrice: Double
    var body: some View {
        HStack(spacing: 20) {
            Rectangle().frame(width: 115, height: 115).cornerRadius(10).offset(x: -10)
            VStack(alignment: .leading, spacing: 10) {
                Text("\(phoneModel) \(phoneSpace)")
                Text("R$\(priceFormatter(price: phonePrice, locale: Strings.locale))")
                HStack {
                    Spacer()
                    heartIcon
                    binocularIconStroke
                }.offset(x: 10)
            }.padding(.top)
                .offset(x: -10)
        }.padding(10)
            .background(RoundedRectangle(cornerRadius: 10)
                .frame(width: 376, height: 129, alignment: .center)
                .foregroundColor(Color(.systemGray6)))
            .padding()
    }

    private var binocularIconStroke: some View {
        return Image(systemName: "binoculars")
            .font(.system(size: 22))
            .background(Circle().stroke().frame(width: 38, height: 38, alignment: .center))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }

    private var heartIcon: some View {
        return Image(systemName: "heart.circle.fill").font(.system(size: 38))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
    }
}

struct FavoriteCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCardView(phoneModel: "IPhone 12", phoneSpace: "128gb", phonePrice: 1234.00)
    }
}
