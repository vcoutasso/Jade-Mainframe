//
//  UserView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import SwiftUI

struct UserView: View {
    let profile: Profile

    var body: some View {
        HStack {
            Image("Images/Icons/avatar")
                .frame(width: LayoutMetrics.circleDiamater, height: LayoutMetrics.circleDiamater, alignment: .center)
                .padding()

            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(Font.system(.title3, design: .default)
                        .weight(.regular))
                    .foregroundColor(Color(Assets.Colors.TecoPalette.darkGray.color))

                Text(profile.email)
                    .font(Font.system(.callout, design: .default)
                        .weight(.regular))
                    .foregroundColor(Color(Assets.Colors.TecoPalette.mediumGray.color))
            }
        }
    }

    private enum LayoutMetrics {
        static let circleDiamater: CGFloat = 106
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(profile: .fixture())
    }
}
