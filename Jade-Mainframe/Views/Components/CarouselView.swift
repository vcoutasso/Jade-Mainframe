//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

struct CarouselView: View {
    
    let products: [Product]
    let categoryTitle: String
    
    var body: some View { 
        VStack(alignment: .leading) {
            
            Text(categoryTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(products) { product in
                        productMiniView(product: product)
                    }
                }
            }
        }
    }
    
    private func productMiniView(product: Product) -> some View {
        VStack {
            Image(product.imageName)
                .frame(width: LayoutMetrics.miniProductWidth, height: LayoutMetrics.miniProductHeight)
            
            Text(product.productName)
        }
    }
    
    private enum LayoutMetrics {
        static let horizontalSpacing: CGFloat = 20
        static let miniProductWidth: CGFloat = 100
        static let miniProductHeight: CGFloat = 100
    }
}

struct CarouselView_Previews: PreviewProvider {
    static private let mockProduct: Product = .fixture()
    
    static var previews: some View {
        CarouselView(products: [Product](repeating: mockProduct, count: 10), categoryTitle: "Lorem Ipsum")
    }
}
