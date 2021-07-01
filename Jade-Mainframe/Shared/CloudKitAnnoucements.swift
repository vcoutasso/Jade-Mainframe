//
//  CloudKitAnnoucements.swift
//  Jade-Mainframe
//
//  Created by João Pedro Picolo on 30/06/21.
//

import CloudKit
import Foundation
import SwiftUI

// MARK: - notes

// good to read: https://www.hackingwithswift.com/read/33/overview
//
// important setup in CloudKit Dashboard:
//
// https://www.hackingwithswift.com/read/33/4/writing-to-icloud-with-cloudkit-ckrecord-and-ckasset
// https://www.hackingwithswift.com/read/33/5/a-hands-on-guide-to-the-cloudkit-dashboard
//
// On your device (or in the simulator) you should make sure you are logged into iCloud and have iCloud Drive enabled.
struct CloudKitAnnoucements {
    // MARK: - record types

    enum RecordType {
        static let AnnouncedIphones = "AnnouncedIphones"
    }

    // MARK: - errors

    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }

    // MARK: - saving to CloudKit

//    static func save(item: Product, completion: @escaping (Result<Product, Error>) -> Void) {
//        let itemRecord = CKRecord(recordType: RecordType.AnnouncedIphones)
//        itemRecord["model"] = item.model
//        itemRecord["memory"] = item.memory
//        itemRecord["memoryRAM"] = item.memoryRAM
//        itemRecord["price"] = item.price
//        itemRecord["discount"] = item.discount
//        itemRecord["screenState"] = item.screenState
//        itemRecord["batteryState"] = item.batteryState
//        itemRecord["backCamera"] = item.backCamera
//        itemRecord["frontalCamera"] = item.frontalCamera
//        itemRecord["acessories"] = item.acessories
//        itemRecord["description"] = item.description
//        itemRecord["invoice"] = item.invoice
//        itemRecord["images"] = item.images
//        CKContainer.default().publicCloudDatabase.save(itemRecord) { record, err in
//            DispatchQueue.main.async {
//                if let err = err {
//                    completion(.failure(err))
//                    return
//                }
//                guard let record = record else {
//                    completion(.failure(CloudKitHelperError.recordFailure))
//                    return
//                }
//                let recordID = record.recordID
//                let model = record["model"] as String?
//                let memory = record["memory"] as String?
//                let memoryRAM = record["memoryRAM"] as String?
//                let price = record["price"] as Double?
//                let discount = record["discount"] as Double?
//                let screenState = record["screenState"] as String?
//                let batteryState = record["batteryState"] as String?
//                let backCamera = record["backCamera"] as String?
//                let frontalCamera = record["frontaCamera"] as String?
//                let acessories = record["acessories"] as String?
//                let description = record["description"] as String?
//                let invoice = record["invoice"] as String?
//                let images = record["images"] as [CKAsset]?
//                let result = Product(recordID: recordID, model: model, memory: memory,
//                                     memoryRAM: memoryRAM, price: price, discount: discount,
//                                     screenState: screenState, batteryState: batteryState, backCamera: backCamera,
//                                     frontalCamera: frontalCamera, acessories: acessories, description: description,
//                                     invoice: invoice, images: images)
//                completion(.success(result))
//            }
//        }
//    }

    // MARK: - fetching from CloudKit

    static func fetch(completion: @escaping (Result<Product, Error>) -> Void) {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "model", ascending: false)
        let query = CKQuery(recordType: RecordType.AnnouncedIphones, predicate: pred)
        query.sortDescriptors = [sort]

        let operation = CKQueryOperation(query: query)
        operation.resultsLimit = 50
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                let model = record["model"] as String?
                let memory = record["memory"] as String?
                let memoryRAM = record["memoryRAM"] as String?
                let price = record["price"] as Double?
                let discount = record["discount"] as Double?
                let screenState = record["screenState"] as String?
                let batteryState = record["batteryState"] as String?
                let backCamera = record["backCamera"] as String?
                let frontalCamera = record["frontaCamera"] as String?
                let acessories = record["acessories"] as String?
                let description = record["description"] as String?
                let invoice = record["invoice"] as String?
                let recordImages = record["images"] as [CKAsset]?
                var images: [UIImage] = []
                for image in recordImages! {
                    if let data = NSData(contentsOf: image.fileURL!) {
                        images.append(UIImage(data: data as Data)!)
                    }
                }
                print(images)
                let result = Product(recordID: recordID, model: model, memory: memory,
                                     memoryRAM: memoryRAM, price: price, discount: discount,
                                     screenState: screenState, batteryState: batteryState, backCamera: backCamera,
                                     frontalCamera: frontalCamera, acessories: acessories, description: description,
                                     invoice: invoice, images: images)
                completion(.success(result))
            }
        }
        operation.queryCompletionBlock = { /* cursor */ _, err in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
            }
        }
        CKContainer.default().publicCloudDatabase.add(operation)
    }

    // MARK: - delete from CloudKit

//    static func delete(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord.ID, Error>) -> Void) {
//        CKContainer.default().publicCloudDatabase.delete(withRecordID: recordID) { recordID, err in
//            DispatchQueue.main.async {
//                if let err = err {
//                    completion(.failure(err))
//                    return
//                }
//                guard let recordID = recordID else {
//                    completion(.failure(CloudKitHelperError.recordIDFailure))
//                    return
//                }
//                completion(.success(recordID))
//            }
//        }
//    }

    // MARK: - modify in CloudKit

//    static func modify(item: Product, completion: @escaping (Result<Product, Error>) -> Void) {
//        guard let recordID = item.recordID else { return }
//        CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { record, err in
//            if let err = err {
//                DispatchQueue.main.async {
//                    completion(.failure(err))
//                }
//                return
//            }
//            guard let record = record else {
//                DispatchQueue.main.async {
//                    completion(.failure(CloudKitHelperError.recordFailure))
//                }
//                return
//            }
//            record["model"] = item.model
//            record["memory"] = item.memory
//            record["memoryRAM"] = item.memoryRAM
//            record["price"] = item.price
//            record["discount"] = item.discount
//            record["screenState"] = item.screenState
//            record["batteryState"] = item.batteryState
//            record["backCamera"] = item.backCamera
//            record["frontalCamera"] = item.frontalCamera
//            record["acessories"] = item.acessories
//            record["description"] = item.description
//            record["invoice"] = item.invoice
//            record["images"] = item.images
//
//            CKContainer.default().publicCloudDatabase.save(record) { record, err in
//                DispatchQueue.main.async {
//                    if let err = err {
//                        completion(.failure(err))
//                        return
//                    }
//                    guard let record = record else {
//                        completion(.failure(CloudKitHelperError.recordFailure))
//                        return
//                    }
//                    let recordID = record.recordID
//                    let model = record["model"] as String?
//                    let memory = record["memory"] as String?
//                    let memoryRAM = record["memoryRAM"] as String?
//                    let price = record["price"] as Double?
//                    let discount = record["discount"] as Double?
//                    let screenState = record["screenState"] as String?
//                    let batteryState = record["batteryState"] as String?
//                    let backCamera = record["backCamera"] as String?
//                    let frontalCamera = record["frontaCamera"] as String?
//                    let acessories = record["acessories"] as String?
//                    let description = record["description"] as String?
//                    let invoice = record["invoice"] as String?
//                    let images = [UIImage]()
//                    for image in recordImages! {
//                        images.append(image.toUIImage())
//                    }
//                    let result = Product(recordID: recordID, model: model, memory: memory,
//                                         memoryRAM: memoryRAM, price: price, discount: discount,
//                                         screenState: screenState, batteryState: batteryState, backCamera: backCamera,
//                                         frontalCamera: frontalCamera, acessories: acessories, description: description,
//                                         invoice: invoice, images: images)
//                    completion(.success(result))
//                }
//            }
//        }
//    }
}
