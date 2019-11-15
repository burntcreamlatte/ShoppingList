//
//  Entry+Convenience.swift
//  ShoppingList
//
//  Created by Aaron Shackelford on 11/15/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init(entryBody: String, isChecked: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.entryBody = entryBody
        self.isChecked = false
    }
}
