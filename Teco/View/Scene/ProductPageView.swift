//
//  SelectedProductView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct ProductPageView: View {
    @ObservedObject var viewModel: ProductPageManager

    var body: some View {
        ScrollView {
            ProductPageHeaderView(product: viewModel.product)

            ProductPageInfoView(viewModel: viewModel)
        }
    }
}

struct ProductPageViewPreviews: PreviewProvider {
    static var previews: some View {
        ProductPageView(viewModel: .init(product: .fixture()))
    }
}
