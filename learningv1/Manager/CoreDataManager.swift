//
//  CoreDataManager.swift
//  learningv1
//
//  Created by Furqan Ali on 3/12/25.
//

// using coredatamanager we should be able to access the view context.

import Foundation
import CoreData


class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        
        
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "learningv1Model")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unable to initialize core data \(error), \(error.userInfo)")
            }
        }
    }
    
}



