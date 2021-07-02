//
//  AddDesiredProductsView.swift
//  Teco
//
//  Created by Guilerme Barciki on 01/07/21.
//

import SwiftUI

struct AddDesiredProductsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("\(Assets.Images.Banners.bannerCansado.name)")
                    .frame(width: 390, height: 216)
                Text("receba notificacoes..")
                Text("coloque...")
                VStack(alignment: .leading) {
                    productIsChosen // "iPhone 12 128GB"é um dado entrando
                    //                    productNotChosen
                }
                // descricao
                // descricao do usado
                // faixa de preco

                moreButton
                confirmButtom
            }
        }
    }

    private var productIsChosen: some View {
        VStack(alignment: .leading) {
            Text("""
            Você escolheu o produto iPhone 12 128GB como base pra procurarmos produtos similares pra você.\n
            Quando vendedores anunciarem produtos que se encaixam neste perfil, avisaremos você na hora.\n
            Quais destas características você quer manter pra procura?
            """)
                .font(Font.system(size: 15))
        }.frame(width: 302)
    }

    private var productNotChosen: some View {
        VStack(alignment: .leading) {
            Text("""
            Receba notificações de venderores\ncom os produtos que você deseja, na\nfaixa de preço escolhida.\n
            Coloque o que você precisa e a gente\navisa quando chegar. Não perca nenhuma oferta.
            """).font(Font.system(size: 15))
        }.frame(width: 302)
    }

    private var moreButton: some View {
        return Text(Strings.seeMore)
            .fontWeight(.semibold)
            .frame(width: 349, height: 49, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color)).padding(.top)
    }

    private var confirmButtom: some View {
        return Text(Strings.confirmFeatures).foregroundColor(.white)
            .fontWeight(.semibold)
            .frame(width: 349, height: 49, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(Color(Assets.Colors.TecoPalette.darkBlue.color))
            .padding(.top)
    }
}

struct AddDesiredProductsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDesiredProductsView()
    }
}
