//
//  Extensions.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 01/07/21.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
