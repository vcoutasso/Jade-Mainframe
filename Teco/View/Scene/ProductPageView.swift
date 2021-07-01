//
//  SelectedProductView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct ProductPageView: View {
    let product: Product

    var body: some View {
        ScrollView {
            ProductPageHeaderView(product: product)

            ProductPageInfoView(product: product)
        }
    }
}

struct ProductPageViewPreviews: PreviewProvider {
    static var previews: some View {
        ProductPageView(product: .fixture())
    }
}
