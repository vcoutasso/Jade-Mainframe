//
//  SellingView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct SellingView: View {
    // MARK: - Body

    var body: some View {
        NavigationView {
            NotFoundView()
                .navigationTitle(Strings.goBack)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct RegisterSaleView_Previews: PreviewProvider {
    static var previews: some View {
        SellingView()
    }
}
