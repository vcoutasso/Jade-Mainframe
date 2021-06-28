//
//  HomeView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Body

    var carousels: [Carousel] = [.fixture(), .fixture(), .fixture()]

    var body: some View {
        ScrollView {
            VStack {
                headerView
                storiesView
                bannerView
                carouselListView
            }
        }
    }

    private var headerView: some View {
        ZStack {
            Color(Assets.Colors.backgroundBlue.color)
                .ignoresSafeArea(edges: .top)
            HStack {
                Spacer()
                SearchBarView(viewModel: .init())
                Spacer()
            }
        }
    }

    private var storiesView: some View {
        StoriesView(viewModel: .init(products: [.fixture()]))
    }

    private var bannerView: some View {
        BannerView()
    }

    private var carouselListView: some View {
        ForEach(carousels) { carousel in
            CarouselView(viewModel: .init(carousel: carousel))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
