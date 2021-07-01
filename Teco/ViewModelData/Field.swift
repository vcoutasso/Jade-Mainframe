//
//  Field.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 26/06/21.
//

import Foundation
import SwiftUI

enum FieldStyle {
    case regular
    case price
}

struct Field {
    var title: String
    var placeholderText: String
    var isRequired: Bool
    var style: FieldStyle
    var inputText: String {
        didSet {
            if inputText.count > maxLength, oldValue.count <= maxLength {
                inputText = oldValue
            }
        }
    }

    var titleColor: Color
    let maxLength: Int
    let autocapitalizationType: UITextAutocapitalizationType
}
