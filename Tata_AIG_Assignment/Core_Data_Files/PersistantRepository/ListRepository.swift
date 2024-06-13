//
//  PersonRepository.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import CoreData

protocol ListBasicOperations : AnyObject{
    func create(list : ListModel)
    func getAll()->[ListModel]
    func deleteAllData()
}

class ListRepository : ListBasicOperations{
       
    //  MARK: CREATE_METHOD
    
    func create(list: ListModel) {
        let cdList = CDList(context: PersistantStorage.shared.context)
        cdList.listImage = list.listImage
        cdList.listTitle = list.listTitle
        PersistantStorage.shared.saveContext()
    }
    
    
    //  MARK: RETRIEVE_LIST_ENTITY
    
    func getAll() -> [ListModel] {
        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDList.self)
        var lists = [ListModel]()
        result?.forEach({ list in
            lists.append(list.convertCDListToListModel())
        })
        return lists
    }
    
    //  MARK: DELETE_ENTITIES
    
    func deleteAllData() {
        let context = PersistantStorage.shared.context
            // Fetch all entities and delete them
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDList")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try context.execute(batchDeleteRequest)
                try context.save()
            } catch {
                print("Error deleting data: \(error)")
            }
        }
}


// MARK: EXTENSION_CDLIST

extension CDList{
    func convertCDListToListModel()->ListModel{
        var list = ListModel()
        list = ListModel(listImage: self.listImage, listTitle: self.listTitle)
        return list
    }
}
