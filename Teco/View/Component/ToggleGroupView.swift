//
//  ToggleGroupView.swift
//  Teco
//
//  Created by João Pedro Picolo on 01/07/21.
//

import SwiftUI

struct ToggleGroupView: View {
    // MARK: - Variables

    let groupName: String
    @Binding public var filters: [Filter]

    // MARK: - Body

    var body: some View {
        VStack {
            Text(groupName)
                .frame(width: LayoutMetrics.frameWidth, height: LayoutMetrics.frameHeight, alignment: .leading)
                .font(Font.system(size: 16, weight: .semibold, design: .default))

            HStack {
                Spacer()
                groupInformation().frame(width: 351)
                Spacer()
            }
        }.padding()
    }

    private func groupInformation() -> some View {
        VStack {
            ForEach(0 ..< filters.count) { filterIdx in
                DisclosureGroup(isExpanded: $filters[filterIdx].isOpen) {
                    ForEach(0 ..< filters[filterIdx].availables.count) { idx in
                        disclosureGroupItem(value: filterIdx, index: idx)
                    }
                } label: {
                    Text(filters[filterIdx].name)
                        .foregroundColor(Color(Teco.Assets.Colors.TecoPalette.mediumDarkGray.name))
                        .font(Font.system(size: 16, weight: .semibold, design: .default))
                }
                .padding([.leading, .trailing]).offset(y: 3)

                Divider().background(Color(.systemGray2))
            }
        }
        .accentColor(Color(.systemGray))
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    private func disclosureGroupItem(value: Int, index: Int) -> some View {
        VStack {
            Divider()
            HStack {
                HStack {
                    Toggle(isOn: $filters[value].selected[index]) {
                        Text(filters[value].availables[index])
                    }
                }
                .padding(2)
            }
            .font(Font.system(size: 17, weight: .regular, design: .default))
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let frameWidth: CGFloat = 351
        static let frameHeight: CGFloat = 34
        static let cornerRadius: CGFloat = 10
        static let searchTextPadding: CGFloat = 38
        static let allPadding: CGFloat = 10
        static let iconPadding: CGFloat = 9
        static let horizontalPadding: CGFloat = 14
    }
}

// struct ToggleGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToggleGroupView()
//    }
// }
