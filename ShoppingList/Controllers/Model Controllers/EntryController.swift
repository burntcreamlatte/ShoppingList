//
//  EntryController.swift
//  ShoppingList
//
//  Created by Aaron Shackelford on 11/15/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    // MARK: - Properties
    //singleton method
    static let sharedInstance = EntryController()
    
    //SOT, is this better as a var or a constant? I've seen both implemented
    var fetchedResultsController: NSFetchedResultsController<Entry>
    
    init() {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        //we aren't implementing checked and incompleted sections
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController = resultsController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
        }
    }
    
    
    // MARK: - CRUD Functions
    
    func addNew(entryWithBody entryBody: String) {
        _ = Entry(entryBody: entryBody)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, entryBody: String, isChecked: Bool) {
        entry.entryBody = entryBody
        entry.isChecked = isChecked
        saveToPersistentStore()
    }
    
    func delete(entry: Entry) {
        CoreDataStack.context.delete(entry)
        saveToPersistentStore()
    }
    
    func toggle(entry: Entry) {
        entry.isChecked.toggle()
    }
    
    // MARK: Save to Persistence
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
        }
    }
}
