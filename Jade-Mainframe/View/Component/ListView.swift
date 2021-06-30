//
//  ListView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import SwiftUI
struct ListView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: ListManager

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .font(.headline)
                .fontWeight(.regular)
                .padding(.leading)
                .foregroundColor(Color(.systemGray))
            VStack {
                ForEach(viewModel.content.list) { content in
                    lineComponent(lineContent: content)
                    Divider()
                }
            }.padding()
        }
    }

    private func lineComponent(lineContent: LineContent) -> some View {
        HStack {
            HStack {
                Image(systemName: lineContent.iconURL)
                    .foregroundColor(Color(.systemGray))
                    .font(.title2).padding(.trailing)
            }.frame(width: 30, height: 30, alignment: .center).padding(.leading, 5)
            HStack(alignment: .firstTextBaseline) {
                Text(lineContent.description)
                Spacer()
                Image(systemName: lineContent.arrowIcon)
                    .foregroundColor(Color(.systemGray))
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    private static let mockList: ListContent = .fixture()
    private static let mockViewModel: ListManager = .init(title: "COMPRA E VENDA", content: mockList)
    static var previews: some View {
        ListView(viewModel: mockViewModel)
    }
}
