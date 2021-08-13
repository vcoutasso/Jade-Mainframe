//
//  ProfileMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

#if DEBUG
    extension Profile {
        static func fixture(
            name: String = "Joãozinho Pedro",
            email: String = "joaozinho.p@icloud.com",
            location: String = "Curitiba, PR"
        ) -> Profile {
            .init(name: name, email: email, location: location)
        }
    }
#endif
