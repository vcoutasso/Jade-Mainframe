//
//  BannerView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

struct BannerView: View {
    private var numberOfImages = 3
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0 ..< numberOfImages) { num in
                Image("banner \(num)")
                    .frame(width: 362, height: 102, alignment: .center)
                    .padding(14)
            }
        }.tabViewStyle(PageTabViewStyle())
            .onReceive(timer, perform: { _ in
                withAnimation {
                    currentIndex = currentIndex <
                        numberOfImages - 1 ? currentIndex + 1 : 0
                }
            })
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
