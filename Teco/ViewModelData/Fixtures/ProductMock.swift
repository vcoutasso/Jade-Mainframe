//
//  ProductMock.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import CloudKit
import Foundation
import SwiftUI

#if DEBUG
    extension Product {
        static func fixture(
            model: String = "iPhone 12",
            memory: String = "128 GB",
            memoryRAM: String = "12 GB",
            price: Double = 5329.0,
            discount: Double = 0.2,
            screenState: String = "Precisando de troca de tela",
            batteryState: String = "Acima de 80%",
            backCamera: String = "12 Mpx",
            frontalCamera: String = "12 Mpx",
            acessories: String = "Não",
            description: String = "Descrição",
            invoice: String = "Sim",
            useTime: String = "2 anos",
            images: [UIImage] = [Assets.Images._12.image, Assets.Images._12.image]
        ) -> Product {
            .init(model: model, memory: memory, memoryRAM: memoryRAM,
                  price: price, discount: discount, screenState: screenState,
                  batteryState: batteryState, backCamera: backCamera, frontalCamera: frontalCamera,
                  acessories: acessories, description: description, invoice: invoice, useTime: useTime, images: images)
        }

        static func fixtureDiscount(
            model: String = "iPhone 12",
            memory: String = "128 GB",
            memoryRAM: String = "12 GB",
            price: Double = 5329.0,
            discount: Double = 0.2,
            screenState: String = "Precisando de troca de tela",
            batteryState: String = "Acima de 80%",
            backCamera: String = "12 Mpx",
            frontalCamera: String = "12 Mpx",
            acessories: String = "Não",
            description: String = "Descrição",
            invoice: String = "Sim",
            useTime: String = "2 anos",
            images: [UIImage] = []
        ) -> Product {
            .init(model: model, memory: memory, memoryRAM: memoryRAM,
                  price: price, discount: discount, screenState: screenState,
                  batteryState: batteryState, backCamera: backCamera, frontalCamera: frontalCamera,
                  acessories: acessories, description: description, invoice: invoice, useTime: useTime, images: images)
        }
    }
#endif
