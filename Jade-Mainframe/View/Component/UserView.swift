//
//  UserView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 29/06/21.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 106, height: 106, alignment: .center)
                .padding()
            VStack(alignment: .leading) {
                Text("Joãozinho Pedro")
                Text("joaozinho.p@icloud.com")
                    .foregroundColor(Color(.systemGray))
                    .font(.subheadline)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
