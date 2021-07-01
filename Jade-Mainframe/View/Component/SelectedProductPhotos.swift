//
//  SelectProductPhotos.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 30/06/21.
//

import SwiftUI

struct SelectedProductPhotos: View {
    var body: some View {
        TabView {
            // Aqui vai ser um ForEach com um vetor de imagens
            Image("pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 390, height: 260)
                .background(Color(.black))
                .cornerRadius(20)
        }
    }
}

struct SelectProductedPhotos_Previews: PreviewProvider {
    static var previews: some View {
        SelectedProductPhotos()
    }
}
