//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

private struct Product: Identifiable {
    var id = UUID()
    let productName, imageName: String
    
}

struct CarouselView: View {
    
    // associar isso ao banco de dados
    // os parametros ainda devem ser decididos
   private let products: [Product] = [
    Product( productName: "0", imageName: "0"),
    Product( productName: "0fe", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    Product( productName: "0fef", imageName: "0"),
    ]
    let categorieTitle = "titulo"
 
    var body: some View { 
        VStack(alignment: .leading) {
            
            Text(categorieTitle)
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
    static var previews: some View {
        CarouselView()
    }
}
