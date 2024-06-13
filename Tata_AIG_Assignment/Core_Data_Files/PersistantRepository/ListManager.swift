//
//  PersonManager.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation

class ListManager : ListBasicOperations{
        
    private var listRepository = ListRepository()
    
    //  MARK: CREATE_ENTITY
    
    func create(list: ListModel) {
        listRepository.create(list: list)
    }
    
    //  MARK: GET_ALL_ENTITIES
    
    func getAll() -> [ListModel] {
        listRepository.getAll()
    }
    
    //  MARK: DELETE_ENTITIES
    
    func deleteAllData() {
        listRepository.deleteAllData()
    }
}
