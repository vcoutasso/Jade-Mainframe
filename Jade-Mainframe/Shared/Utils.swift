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
