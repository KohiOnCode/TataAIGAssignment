//
//  PersistantStorage.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import CoreData

class PersistantStorage{
    static let shared = PersistantStorage()
    
   lazy var context = persistentContainer.viewContext
    
    private init(){
        
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tata_AIG_Assignment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //  MARK: FETCH_NSMANAGED_OBJECT_GENERIC_METHOD
    
    func fetchManagedObject<T:NSManagedObject>(managedObject:T.Type)->[T]?{
        do{
            guard let result = try? context.fetch(managedObject.fetchRequest()) as? [T] else{
                return nil
            }
            return result
        }
        catch(let err){
            debugPrint(err)
        }
    }
    
    
}
