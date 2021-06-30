//
//  ProfileView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Body

    var body: some View {
        VStack {
            UserView().padding()
            comprasVendas
            conta
            institucional
            Spacer()
        }
    }

    private var comprasVendas: some View {
        let comprasVendas = ListContent(list: [
            LineContent(iconURL: "bag", description: "Produtos anunciados"),
            LineContent(iconURL: "creditcard", description: "Formas de pagamento"),
        ])
        return ListView(viewModel: ListManager(title: "COMPRA E VENDA", content: comprasVendas))
    }

    private var conta: some View {
        let conta = ListContent(list: [LineContent(iconURL: "gearshape.2", description: "Configurações"),
                                       LineContent(iconURL: "questionmark.circle", description: "Central de ajuda")])
        return ListView(viewModel: ListManager(title: "Conta", content: conta))
    }

    private var institucional: some View {
        let institucional = ListContent(list: [LineContent(iconURL: "info.circle", description: "Sobre nós")])
        return ListView(viewModel: ListManager(title:
            "INSTITUCIONAL", content: institucional))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
