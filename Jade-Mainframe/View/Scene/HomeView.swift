//
//  HomeView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Variables

    @ObservedObject var viewModel: HomeManager

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            headerView
            ScrollView(showsIndicators: false) {
                VStack {
                    storiesView
                    /* DEPRECATED (for now at least) */
                    // bannerView
                    carouselListView
                }
            }
        }
        .onAppear {
            // MARK: - fetch annoucements from CloudKit

            CloudKitAnnoucements.fetch { result in
                switch result {
                case let .success(newItem):
                    viewModel.carousel.carousels[1].products.append(newItem)
                case let .failure(err):
                    print(err)
                }
            }
        }
    }

    // MARK: - Private View Variables

    private var headerView: some View {
        GeometryReader { geometry in
            ZStack {
                Color(Assets.Colors.TecoPalette.lightGray.color)
                    .ignoresSafeArea(edges: .top)

                HStack {
                    Spacer()
                    SearchBarView(viewModel: viewModel.searchBar)
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(height: UIScreen.main.bounds.height / 10)
    }

    private var storiesView: some View {
        StoriesView(viewModel: viewModel.stories)
    }

    private var bannerView: some View {
        BannerView()
    }

    private var carouselListView: some View {
        CarouselView(viewModel: viewModel.carousel)
    }
}

struct HomeView_Previews: PreviewProvider {
    private static var mockModel: HomeManager = .init(
        searchBar: SearchBarManager(),
        stories: StoriesManager(products: [.fixture(), .fixtureDiscount()]),
        carousel: CarouselManager(carousels: [.fixture(), .fixtureDiscount()]
        )
    )

    static var previews: some View {
        HomeView(viewModel: mockModel)
    }
}
