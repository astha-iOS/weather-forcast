//
//  CoreDataService.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation
import UIKit
import CoreData

class Persistent {
    static let shared = Persistent()
    private init() {
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func managedObjectContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func clearStorage(forEntity entity: String) {
        let isInMemoryStore = persistentContainer.persistentStoreDescriptions.reduce(false) {
            return $0 ? true : $1.type == NSInMemoryStoreType
        }
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        if isInMemoryStore {
            do {
                let entities = try managedObjectContext.fetch(fetchRequest)
                for entity in entities {
                    managedObjectContext.delete(entity as! NSManagedObject)
                }
            } catch let error as NSError {
                print(error)
            }
        } else {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try managedObjectContext.execute(batchDeleteRequest)
            } catch let error as NSError {
                print(error)
            }
        }
    }
}
