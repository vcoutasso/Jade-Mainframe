//
//  PriceRangeTextField.swift
//  Teco
//
//  Created by Guilerme Barciki on 01/07/21.
//
import Foundation
import SwiftUI

struct PriceRangeTextField: View {
    @State private var minPrice: String = ""
    @State private var maxPrice: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            minPriceTextField.offset(y: 2)
            Divider().foregroundColor(Color(.systemGray2))
            maxPriceTextField
        }.frame(width: 351, height: 82).background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(.systemGray6)))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke())
                    .foregroundColor(Color(.systemGray3))
    }

    private var minPriceTextField: some View {
        HStack {
            Text("Mínimo")
                .padding(.leading, 20)
                .foregroundColor(Color(Teco
                        .Assets
                        .Colors
                        .TecoPalette
                        .mediumDarkGray.name))
            Spacer()
            Text("R$")
                .foregroundColor(Color(Teco
                        .Assets
                        .Colors
                        .TecoPalette
                        .darkBlue.name))
            TextField(
                "",
                text: $minPrice
            )
            .frame(width: 75, height: 23, alignment: .leading)
            .background(Color(.white))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke())
            .foregroundColor(Color(.systemGray3))
            .padding(.trailing)
        }
    }

    private var maxPriceTextField: some View {
        HStack {
            Text("Máximo").padding(.leading, 20)
                .foregroundColor(Color(Teco
                        .Assets
                        .Colors
                        .TecoPalette
                        .mediumDarkGray
                        .name))
            Spacer()
            Text("R$")
                .foregroundColor(Color(Teco
                        .Assets
                        .Colors
                        .TecoPalette
                        .darkBlue.name))
            TextField(
                "",
                text: $maxPrice
            )
            .frame(width: 75, height: 23, alignment: .leading)
            .background(Color(.white))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke())
            .foregroundColor(Color(.systemGray3))
            .padding(.trailing)
        }
    }
}

struct PriceRangeTextField_Previews: PreviewProvider {
    static var previews: some View {
        PriceRangeTextField()
    }
}
