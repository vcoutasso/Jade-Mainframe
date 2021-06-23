//
//  CarouselView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

private struct Produto: Identifiable {
    var id = UUID()
    let productTitle, imageUrl: String
    
}

struct CarouselView: View {
    
    // associar isso ao banco de dados
    // os parametros ainda devem ser decididos
   private let products: [Produto] = [  Produto( productTitle: "0", imageUrl: "0"),
                                        Produto( productTitle: "0fe", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),
                                        Produto( productTitle: "0fef", imageUrl: "0"),

    ]
    
   
    
    
    
    var body: some View {
        NavigationView{
            
            
            VStack(alignment: .leading){
                Text("titulo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                ScrollView(.horizontal){
                        HStack(spacing: 20){
                            
                            ForEach(products){ item in
                                ProductMiniView(productIdentification: item.productTitle, imageUrl: item.imageUrl)
                            }
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
            Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Text(productIdentification)
        }
    }
}
}
