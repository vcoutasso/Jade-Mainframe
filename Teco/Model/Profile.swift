//
//  Profile.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let location: String
}
