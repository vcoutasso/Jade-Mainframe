//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

private struct Product: Identifiable {
    var id = UUID()
    let productName, imageUrl: String
    
}

struct CarouselView: View {
    
    // associar isso ao banco de dados
    // os parametros ainda devem ser decididos
   private let products: [Product] = [
    Product( productName: "0", imageUrl: "0"),
    Product( productName: "0fe", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    Product( productName: "0fef", imageUrl: "0"),
    ]
    let categorieTitle = "titulo"
 
    var body: some View { 
        VStack(alignment: .leading){
            
            Text(categorieTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    ForEach(products){ item in
                        ProductMiniView(productIdentification: item.productName, imageUrl: item.imageUrl)
                    }
                }
            }
        }
        
    }

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}

struct ProductMiniView : View {
    let productIdentification: String
    let imageUrl: String
    var body: some View{
        VStack{
        // Seria Image(imageUrl) ao inves do retangulo
            Image(systemName: "").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).background(Color(.black))
            Text(productIdentification)
        }
    }
}
}
