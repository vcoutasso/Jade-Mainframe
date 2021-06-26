//
//  StoriesView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

// @ObservedObject var viewModel: StorieViewModel
struct StoriesView: View {
    var body: some View {
        VStack{
            
            ScrollView(.horizontal){
                Rectangle().frame(width: 100, height: 100, alignment: .center)
            }
        }
    }
    
    private func productStoriesView(product: Product) -> some View {
        Text("kk")
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
