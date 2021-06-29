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
                .font(.title2)
                .padding(.leading)
            List {
                // lineComponent(lineContent: viewModel.lineContent)
                ForEach(viewModel.content.list) { content in
                    lineComponent(lineContent: content)
                }
            }.offset(y: -10)
        }
    }

    private func lineComponent(lineContent: LineContent) -> some View {
        HStack {
            Image(systemName: lineContent.iconURL)
                .foregroundColor(Color(.systemGray))
            Text(lineContent.description)
            Spacer()
            Image(systemName: lineContent.arrowIcon)
                .foregroundColor(Color(.systemGray))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    private static let mockList: ListContent = .fixture(title: "testao")
    private static let mockViewModel: ListManager = .init(title: "teste", content: mockList)
    static var previews: some View {
        ListView(viewModel: mockViewModel)
    }
}
