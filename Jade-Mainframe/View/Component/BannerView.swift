//
//  BannerView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

struct BannerView: View {
    // MARK: - Variables

    @State private var currentIndex = 0
    private var numberOfImages = 3
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    // MARK: - Body

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0 ..< numberOfImages) { num in
                Image(Assets.allImages[num].name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
            }
        }.tabViewStyle(PageTabViewStyle())
            .onReceive(timer, perform: { _ in
                withAnimation {
                    currentIndex = currentIndex <
                        numberOfImages - 1 ? currentIndex + 1 : 0
                }
            })
            .scaledToFit()
    }
}

// MARK: - Layout Metrics

private enum LayoutMetrics {
    static let bannerPadding: CGFloat = 14
    static let bannerWidth: CGFloat = 390
    static let bannerHeight: CGFloat = 137
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
