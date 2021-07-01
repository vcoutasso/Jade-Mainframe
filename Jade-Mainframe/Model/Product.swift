//
//  Product.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import CloudKit
import Foundation
import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    var recordID: CKRecord.ID?
    let model: String?
    let memory: String?
    let memoryRAM: String?
    let price: Double?
    let discount: Double?
    let screenState: String?
    let batteryState: String?
    let backCamera: String?
    let frontalCamera: String?
    let acessories: String?
    let description: String?
    let invoice: String?
    let images: [UIImage]?
}
