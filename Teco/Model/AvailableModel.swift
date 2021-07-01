//
//  AvailableModel.swift
//  Jade-Mainframe
//
//  Created by João Pedro Picolo on 30/06/21.
//

import CloudKit
import SwiftUI

struct AvailableModel: Identifiable {
    var id = UUID()
    var recordID: CKRecord.ID?
    var memoryOptions: [CKRecord.Reference]?
    var colorOptions: [CKRecord.Reference]?
    var name: String
}
