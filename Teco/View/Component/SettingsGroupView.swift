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
                .font(.body)
                .fontWeight(.regular)
                .padding(.leading)
                .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
            VStack {
                ForEach(options) { option in
                    NavigationLink(destination: NotFoundView(), label: {
                        lineComponent(lineContent: option)
                    })
                    Divider()
                }
            }
            .padding()
        }
    }

    private func lineComponent(lineContent: SettingsEntry) -> some View {
        HStack {
            HStack {
                Image(systemName: lineContent.iconName)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
                    .font(.title3)
                    .padding(.trailing)
            }
            .frame(width: LayoutMetrics.frameWidth, height: LayoutMetrics.frameHeight, alignment: .center)
            .padding(.leading, LayoutMetrics.leadingPaddding)

            HStack(alignment: .firstTextBaseline) {
                Text(lineContent.description)
                    .font(.body)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.darkGray.color))
                Spacer()
                Image(systemName: lineContent.arrowIcon)
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
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
