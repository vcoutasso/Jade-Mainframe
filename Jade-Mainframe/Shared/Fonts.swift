//
//  Fonts.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 01/07/21.
//

import SwiftUI
let titleFont = Font.system(.body, design: .default)
    .weight(.bold)

struct Fonts: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(titleFont)
    }
}

struct Fonts_Previews: PreviewProvider {
    static var previews: some View {
        Fonts()
    }
}
