//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

struct CarouselView: View {
    
    @ObservedObject var viewModel: CarouselViewModel
    
    var body: some View { 
        VStack(alignment: .leading) {
            
            Text(viewModel.categoryTitle)
                .font(.body)
                .fontWeight(.medium)
                .lineLimit(1)
                .offset(y: 15)
            
            ScrollView(.horizontal) {
                HStack(spacing: LayoutMetrics.horizontalSpacing) {
                    ForEach(viewModel.products) { product in
                        productMiniView(product: product)
                    }
                }
            }
        }.padding(.leading)
    }
    
    private func productMiniView(product: Product) -> some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(.white))
                .frame(width: LayoutMetrics.miniCardWidth, height: LayoutMetrics.miniCardHeight)
                .cornerRadius(10)
                .shadow(radius: 5, x: 5, y: 5)
                .padding()
            
            
            VStack(alignment: .leading, spacing: 0) {
                Image(product.imageName)
                    .frame(width: LayoutMetrics.miniProductWidth, height: LayoutMetrics.miniProductHeight)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                VStack(alignment: .leading){
                    Text(product.productName).font(.footnote)
                        .foregroundColor(Color(.systemGray2))
                    Text("R$ \(product.productPrice).00")
                        .font(.callout)
                        .foregroundColor(.black)
                }
            }
            
        }
    }
    
    private enum LayoutMetrics {
        static let horizontalSpacing: CGFloat = 20
        static let miniProductWidth: CGFloat = 135
        static let miniProductHeight: CGFloat = 82
        static let miniCardWidth: CGFloat = 146
        static let miniCardHeight: CGFloat = 129
    }
}

struct CarouselView_Previews: PreviewProvider {
    
    static private let mockProduct: Product = .fixture()
    static private let viewModel: CarouselViewModel = .init(products: [Product](repeating: mockProduct, count: 10), categoryTitle: "Adicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados RecentementeAdicionados Recentemente")
    
    static var previews: some View {
        CarouselView(viewModel: viewModel)
    }
}
        
