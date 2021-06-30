//
//  Profile.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 30/06/21.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    var name: String
    var email: String
}
