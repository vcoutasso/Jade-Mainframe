//
//  ProfileManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

class ProfileManager: ObservableObject {
    // MARK: - Published Variables

    @Published var profile: Profile

    // MARK: - Initialization

    init(profile: Profile) {
        self.profile = profile
    }

    // MARK: - Constants

    let announcedProductsSymbolName: String = "bag"
    let paymentMethodsSymbolName: String = "creditcard"
    let settingsSymbolName: String = "gearshape.2"
    let helpCenterSymbolName: String = "questionmark.circle"
    let aboutUsSymbolName: String = "info.circle"
}
