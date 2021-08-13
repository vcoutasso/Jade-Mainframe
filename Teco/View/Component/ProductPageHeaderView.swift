//
//  SelectProductPhotos.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct ProductPageHeaderView: View {
    let product: Product

    var body: some View {
        TabView {
            if let images = product.images {
                ForEach(0 ..< images.count) { idx in
                    Image(uiImage: images[idx])
                        .resizable()
                        .scaledToFill()
                        .tag(idx)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = Assets.Colors.TecoPalette.lightBlue.color
        }
        .frame(width: LayoutMetrics.frameWidth, height: LayoutMetrics.frameHeight)
        .cornerRadius(LayoutMetrics.cornerRadius, corners: LayoutMetrics.roundedCorners)
    }

    private enum LayoutMetrics {
        static let frameWidth: CGFloat = 390
        static let frameHeight: CGFloat = 252
        static let cornerRadius: CGFloat = 20
        static let roundedCorners: UIRectCorner = [.bottomLeft, .bottomRight]
    }
}

struct SelectProductedPhotos_Previews: PreviewProvider {
    static var previews: some View {
        ProductPageHeaderView(product: .fixture())
    }
}
