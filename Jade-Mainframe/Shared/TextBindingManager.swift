//
//  TextBindingManager.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 22/06/21.
//

import SwiftUI

// Reference: https://stackoverflow.com/a/58364685
class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > maxLength && oldValue.count <= maxLength {
                text = oldValue
            }
        }
    }
    
    var maxLength: Int
    
    init(maxLength: Int) {
        self.maxLength = maxLength
    }
}
