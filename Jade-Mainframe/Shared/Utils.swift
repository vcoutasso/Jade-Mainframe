//
//  Utils.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 28/06/21.
//

import Foundation

// MARK: - Functions

func priceFormatter(price: Double, locale: String) -> String {
    let numberFormatter = NumberFormatter()

    // Atribuindo o locale desejado
    numberFormatter.locale = Locale(identifier: locale)

    // Importante para que sejam exibidas as duas casas após a vírgula
    numberFormatter.minimumFractionDigits = 2

    numberFormatter.numberStyle = .decimal

    return numberFormatter.string(from: NSNumber(value: price)) ?? Strings.invalidPriceWarning
}

import SwiftUI

enum TecoFonts {
    // MARK: - SelectedProductView

    static let titleSelectedProductFont = Font.system(size: 24, weight: .regular, design: .default)
    static let discountSelectedProductFont = Font.system(size: 18, weight: .medium, design: .default)
    static let priceSelectedProductFont = Font.system(size: 28, weight: .medium, design: .default)
    static let subTitleSelectedProductFont = Font.system(size: 16, weight: .medium, design: .default)
    static let descriptionSelectedProductFont = Font.system(size: 16, weight: .regular, design: .default)
    static let lineSelectedProductFont = Font.system(size: 18, weight: .regular, design: .default)
}
