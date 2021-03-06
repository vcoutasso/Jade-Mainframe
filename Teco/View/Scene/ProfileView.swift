//
//  ProfileView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 25/06/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Body

    @ObservedObject var viewModel: ProfileManager

    var body: some View {
        NavigationView {
            ScrollView {
                UserView(profile: viewModel.profile)
                    .padding()

                buyAndSell
                account
                institutional
            }
            .navigationTitle(Strings.goBack)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }

    private var buyAndSell: some View {
        SettingsGroupView(groupTitle: Strings.buyAndSell.uppercased(),
                          options: [
                              SettingsEntry(iconName: viewModel.announcedProductsSymbolName,
                                            description: Strings.announcedProducts),
                              SettingsEntry(iconName: viewModel.paymentMethodsSymbolName,
                                            description: Strings.paymentMethods),
                          ])
    }

    private var account: some View {
        SettingsGroupView(groupTitle: Strings.account.uppercased(),
                          options: [
                              SettingsEntry(iconName: viewModel.settingsSymbolName, description: Strings.settings),
                              SettingsEntry(iconName: viewModel.helpCenterSymbolName, description: Strings.helpCenter),
                          ])
    }

    private var institutional: some View {
        SettingsGroupView(groupTitle: Strings.institutional.uppercased(),
                          options: [
                              SettingsEntry(iconName: viewModel.aboutUsSymbolName, description: Strings.aboutUs),
                          ])
    }
}

struct ProfileView_Previews: PreviewProvider {
    private static let mockModel: ProfileManager = .init(profile: .fixture())

    static var previews: some View {
        ProfileView(viewModel: mockModel)
    }
}
