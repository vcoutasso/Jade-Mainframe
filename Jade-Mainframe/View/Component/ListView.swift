//
//  ListView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import SwiftUI
let teste = ListContent(iconURL: "pencil", description: "blablabla")
let teste2: [ListContent] = [ListContent(iconURL: "pencil", description: "blablabla"),
                             ListContent(iconURL: "pencil", description: "blablabla"),
                             ListContent(iconURL: "pencil", description: "blablabla")]
struct ListView: View {
    // MARK: - Variables

    var body: some View {
        VStack(alignment: .leading) {
            Text("Título da lista")
                .font(.title2)
                .padding(.leading)
            List {
                listComponent(listContent: teste)
                ForEach(teste2) { content in
                    listComponent(listContent: content)
                }
            }.offset(y: -10)
        }
    }

    private func listComponent(listContent: ListContent) -> some View {
        HStack {
            Image(systemName: listContent.iconURL)
            Text(listContent.description)
            Spacer()
            Image(systemName: listContent.arrowIcon)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
