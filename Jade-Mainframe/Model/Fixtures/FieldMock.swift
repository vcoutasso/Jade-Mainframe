//
//  FieldMock.swift
//  Jade-Mainframe
//
//  Created by Vinícius Couto on 26/06/21.
//

import Foundation
import SwiftUI

#if DEBUG
    extension Field {
        static func fixture(
            title: String = "Description",
            placeholderText: String = "Product description",
            isRequired: Bool = false,
            style: FieldStyle = .regular,
            inputText: String = "",
            titleColor: Color = .black,
            maxLength: Int = FieldManager.maxStringLength,
            autocapitalizationType: UITextAutocapitalizationType = .none
        ) -> Field {
            .init(
                title: title,
                placeholderText: placeholderText,
                isRequired: isRequired,
                style: style,
                inputText: inputText,
                titleColor: titleColor,
                maxLength: maxLength,
                autocapitalizationType: autocapitalizationType
            )
        }

        static func fixturePrice(
            title: String = "Price*",
            placeholderText: String = "Price (R$)",
            isRequired: Bool = true,
            style: FieldStyle = .price,
            inputText: String = "",
            titleColor: Color = .black,
            maxLength: Int = FieldManager.maxStringLength,
            autocapitalizationType: UITextAutocapitalizationType = .none
        ) -> Field {
            .init(
                title: title,
                placeholderText: placeholderText,
                isRequired: isRequired,
                style: style,
                inputText: inputText,
                titleColor: titleColor,
                maxLength: maxLength,
                autocapitalizationType: autocapitalizationType
            )
        }
    }
#endif
