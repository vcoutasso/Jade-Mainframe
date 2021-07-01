//
//  CloudKitAvailableModels.swift
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
struct CloudKitAvailableModels {
    // MARK: - record types

    enum RecordType {
        static let AvailableModels = "AvailableModels"
        static let AvailableColors = "AvailableColors"
        static let AvailableMemories = "AvailableMemories"
    }

    // MARK: - errors

    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }

    // MARK: - saving to CloudKit

    static func save(item: AvailableModel, completion: @escaping (Result<AvailableModel, Error>) -> Void) {
        let itemRecord = CKRecord(recordType: RecordType.AvailableModels)
        itemRecord["name"] = item.name as CKRecordValue
        CKContainer.default().publicCloudDatabase.save(itemRecord) { record, err in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let record = record else {
                    completion(.failure(CloudKitHelperError.recordFailure))
                    return
                }
                let recordID = record.recordID
                guard let name = record["name"] as? String else { return }
                guard let memories = record["memory"] as? [CKRecord.Reference] else { return }
                guard let colors = record["color"] as? [CKRecord.Reference] else { return }
                let model = AvailableModel(recordID: recordID, memoryOptions: memories,
                                           colorOptions: colors, name: name)
                completion(.success(model))
            }
        }
    }

    // MARK: - fetching from CloudKit

    static func fetch(completion: @escaping (Result<AvailableModel, Error>) -> Void) {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "name", ascending: false)
        let query = CKQuery(recordType: RecordType.AvailableModels, predicate: pred)
        query.sortDescriptors = [sort]

        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["name", "color", "memory"]
        operation.resultsLimit = 50
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let name = record["name"] as? String else { return }
                guard let memories = record["memory"] as? [CKRecord.Reference] else { return }
                guard let colors = record["color"] as? [CKRecord.Reference] else { return }
                let model = AvailableModel(recordID: recordID, memoryOptions: memories,
                                           colorOptions: colors, name: name)
                completion(.success(model))
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

    static func getReferences(item: AvailableModel, completion: @escaping (Result<[String: [Any]], Error>) -> Void) {
        var ids = [String]()
        // Adds colors ids
        guard let recordColors = item.colorOptions else { return }
        for recordItem in recordColors {
            ids.append(recordItem.recordID.recordName)
        }
        // Adds memories ids
        guard let recordMemories = item.memoryOptions else { return }
        for recordItem in recordMemories {
            ids.append(recordItem.recordID.recordName)
        }
        // Fetch itens
        let recordIDs = ids.map { CKRecord.ID(recordName: $0) }
        let operation = CKFetchRecordsOperation(recordIDs: recordIDs)
        operation.fetchRecordsCompletionBlock = { recoveredRecords, _ in
            var response = ["colors": [], "memories": []]
            guard let records = recoveredRecords else { return }
            for record in records {
                switch record.value.recordType {
                case RecordType.AvailableColors:
                    response["colors"]?.append(record.value)
                case RecordType.AvailableMemories:
                    response["memories"]!.append(record.value)
                default:
                    print("Record type not identified")
                }
            }
            completion(.success(response))
        }
        CKContainer.default().publicCloudDatabase.add(operation)
    }

    // MARK: - delete from CloudKit

    static func delete(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord.ID, Error>) -> Void) {
        CKContainer.default().publicCloudDatabase.delete(withRecordID: recordID) { recordID, err in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let recordID = recordID else {
                    completion(.failure(CloudKitHelperError.recordIDFailure))
                    return
                }
                completion(.success(recordID))
            }
        }
    }

    // MARK: - modify in CloudKit

    static func modify(item: AvailableModel, completion: @escaping (Result<AvailableModel, Error>) -> Void) {
        guard let recordID = item.recordID else { return }
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { record, err in
            if let err = err {
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            guard let record = record else {
                DispatchQueue.main.async {
                    completion(.failure(CloudKitHelperError.recordFailure))
                }
                return
            }
            record["name"] = item.name as CKRecordValue

            CKContainer.default().publicCloudDatabase.save(record) { record, err in
                DispatchQueue.main.async {
                    if let err = err {
                        completion(.failure(err))
                        return
                    }
                    guard let record = record else {
                        completion(.failure(CloudKitHelperError.recordFailure))
                        return
                    }
                    let recordID = record.recordID
                    guard let name = record["name"] as? String else { return }
                    guard let memories = record["memory"] as? [CKRecord.Reference] else { return }
                    guard let colors = record["color"] as? [CKRecord.Reference] else { return }
                    let model = AvailableModel(recordID: recordID, memoryOptions: memories,
                                               colorOptions: colors, name: name)
                    completion(.success(model))
                }
            }
        }
    }
}
