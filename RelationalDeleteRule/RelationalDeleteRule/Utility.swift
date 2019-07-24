//
//  Utility.swift
//  RelationalDeleteRule
//
//  Created by ankit bharti on 24/07/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//

import CoreData

class Utility {
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "RelationalDeleteRule")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addPlayer(name: String, runs: Array<Int32>) {
        let context = persistentContainer.viewContext
        let description = NSEntityDescription.entity(forEntityName: "Player", in: context)
        let entity = NSManagedObject(entity: description!, insertInto: context) as? Player
        entity?.name = name
        
        let run = NSEntityDescription.entity(forEntityName: "Scores", in: context)
        
        var orderedRun = Array<Scores>()
        for score in runs {
            let runEntity = NSManagedObject(entity: run!, insertInto: context) as? Scores
            runEntity?.run = score
            orderedRun.append(runEntity!)
        }
        
        entity?.addToPlayersScore(NSOrderedSet(array: orderedRun))
        
        saveContext()
    }
    
    func fetch() -> [Player] {
        let fetchRequest: NSFetchRequest<Player> = NSFetchRequest(entityName: "Player")
        return (try? persistentContainer.viewContext.fetch(fetchRequest)) ?? []
    }
    
    func deleteAllScores() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Scores")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        let startDate = Date()
        do {
            try persistentContainer.viewContext.execute(batchDeleteRequest)
        } catch {
            print("Couldn't delete")
        }
        
        print("Total time taken: \(Date().timeIntervalSince(startDate)) sec.")
        saveContext()
    }
    
    func fetchScores() -> [Scores] {
        let fetchRequest: NSFetchRequest<Scores> = NSFetchRequest(entityName: "Scores")
        return (try? persistentContainer.viewContext.fetch(fetchRequest)) ?? []
    }
}
