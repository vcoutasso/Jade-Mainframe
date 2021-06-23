//
//  testeCarrossel.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 22/06/21.
//

import SwiftUI

struct testeCarrossel: View {
    @State private var index = 0
    var body: some View {
        VStack{
//            TabView(selection: $index) {
//                ForEach((0..<15), id: \.self) { index in
//                    CardView()
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  
            
            ScrollView(.horizontal){
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    ForEach((0..<15), id: \.self) { index in
                        Rectangle()
                            .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                            .frame(width: 100, height: 100)
                            

                    }
                }
                .padding()
            }
            

        }
        .frame(height: 200)
    }
}

struct CardView: View{
    var body: some View{
        Rectangle()
            .fill(Color.pink)
            .frame(width: 50, height: 50)
            .border(Color.black)
            .padding()
    }
}

struct testeCarrossel_Previews: PreviewProvider {
    static var previews: some View {
        testeCarrossel()
    }
}
