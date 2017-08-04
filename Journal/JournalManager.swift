//
//  JournalManager.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import Foundation
import UIKit
import CoreData
// swiftlint:disable force_cast
let appDelegate = UIApplication.shared.delegate as! AppDelegate
// swiftlint:enable force_cast

enum FetchDataError: Error {
    case fetchTitleError, fetchContentError, fetchPhotoError
}

class JournalManager {

    let context = appDelegate.persistentContainer.viewContext

    func fetchData() -> [Journal] {
        var journals: [Journal] = []

        do {

            journals = try context.fetch(Journal.fetchRequest())

        } catch (let error) {

            print(error)

        }

        return journals
    }

    func addJournal(title: String, content: String, photo: Data) {

        let newJournal = Journal(context: context)

        newJournal.title = title
        newJournal.content = content
        newJournal.photo = photo as NSData

        appDelegate.saveContext()

    }

    func deleteJournal(indexPath: Int) {

        let journals = fetchData()

        context.delete(journals[indexPath])

        appDelegate.saveContext()

    }

}
