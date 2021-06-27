//
//  BannerView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 26/06/21.
//

import SwiftUI

struct BannerView: View {
    // MARK: - Variables

    private var numberOfImages = 3
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0

    // MARK: - Body

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0 ..< numberOfImages) { num in
                Image(Assets.allImages[num].name)
                    .frame(width: LayoutMetrics.bannertWidth, height: LayoutMetrics.bannerHeight, alignment: .center)
                    .padding(LayoutMetrics.bannerPadding)
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

// MARK: - Layout Metrics

private enum LayoutMetrics {
    static let bannerPadding: CGFloat = 14
    static let bannertWidth: CGFloat = 135
    static let bannerHeight: CGFloat = 82
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
