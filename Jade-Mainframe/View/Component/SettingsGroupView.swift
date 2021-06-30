//
//  ListView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import SwiftUI

struct SettingsGroupView: View {
    // MARK: - Variables

    let groupTitle: String
    let options: [SettingsEntry]

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(groupTitle)
                .font(.headline)
                .fontWeight(.regular)
                .padding(.leading)
                .foregroundColor(Color(.systemGray))
            VStack {
                ForEach(options) { option in
                    lineComponent(lineContent: option)
                    Divider()
                }
            }.padding()
        }
    }

    private func lineComponent(lineContent: SettingsEntry) -> some View {
        HStack {
            HStack {
                Image(systemName: lineContent.iconName)
                    .foregroundColor(Color(.systemGray))
                    .font(.title2)
                    .padding(.trailing)
            }
            .frame(width: LayoutMetrics.frameWidth, height: LayoutMetrics.frameHeight, alignment: .center)
            .padding(.leading, LayoutMetrics.leadingPaddding)

            HStack(alignment: .firstTextBaseline) {
                Text(lineContent.description)
                Spacer()
                Image(systemName: lineContent.arrowIcon)
                    .foregroundColor(Color(.systemGray))
            }
        }
    }

    private enum LayoutMetrics {
        static let frameWidth: CGFloat = 30
        static let frameHeight: CGFloat = 30
        static let leadingPaddding: CGFloat = 5
    }
}

struct ListView_Previews: PreviewProvider {
    private static let mockList: [SettingsEntry] = [.fixture(), .fixture()]

    static var previews: some View {
        SettingsGroupView(groupTitle: "COMPRA E VENDA", options: mockList)
    }
}
