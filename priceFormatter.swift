//
//  priceFormatter.swift
//  
//
//  Created by Guilerme Barciki on 24/06/21.
//

import Foundation

func priceFormatter(price: Double, locale: String) -> String {
    let numberFormatter = NumberFormatter()

    // Atribuindo o locale desejado
    numberFormatter.locale = Locale(identifier: locale)

    // Importante para que sejam exibidas as duas casas após a vírgula
    numberFormatter.minimumFractionDigits = 2

    numberFormatter.numberStyle = .decimal

    return numberFormatter.string(from: NSNumber(value: price)) ?? L10n.invalidPriceWarning
}


