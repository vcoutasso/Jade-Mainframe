//
//  ProfileMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

extension Profile {
    static func fixture(
        name: String = "Joãozinho Pedro",
        email: String = "joaozinho.p@icloud.com"
    ) -> Profile {
        .init(name: name, email: email)
    }
}
