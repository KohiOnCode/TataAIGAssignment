//
//  HomeViewModel.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import PKHUD

// MARK: PROTOCOL_FetchHomeScreenData_FOR_DATA_BIND_WITH_CONTROLLER

protocol FetchHomeScreenData : AnyObject{
    func DataFetchedCall(fetched : Bool)
}

class HomeViewModel{
    
    // MARK: VARIABLES
    
    var listArray : [ListModel] = []
    private var listWorkItem : DispatchWorkItem?
    private var listManager = ListManager()
    weak var delegate : FetchHomeScreenData?
    
    // MARK: FETCH_HOME_SCREEN_DATA_VIA_API_METHOD
    
    func fetchHomeScreenData(){
        let url = URL(string: APIUrls.DataListUrl.rawValue)
        APIManager.shared.baseRequestApi(url!, .get) {[weak self] (result: MoviesModel?) in
            guard let response = result else {return}
            let semaphore = DispatchSemaphore(value: 1)
            semaphore.wait()
            self?.listManager.deleteAllData()
            semaphore.signal()
            response.search.forEach {[weak self] movie in
                autoreleasepool {
                    let listModel = ListModel(listImage: movie.poster, listTitle: movie.title)
                    self?.listManager.create(list: listModel)
                }
            }
            self?.delegate?.DataFetchedCall(fetched: true)
        }
    }
    
    // MARK: FETCH_HOME_SCREEN_DATA_VIA_LOCAL_DB
    
    func getListsData()->[ListModel]{
        listArray = listManager.getAll()
        return listArray
    }
    
    
    // MARK: FILTER_HOME_SCREEN_DATA_METHOD
    
    func filterData(searchText: String, completion: @escaping ([ListModel]) -> Void) {
        print(searchText)
        listWorkItem?.cancel()
        let filterWorkItem = DispatchWorkItem {
            let filteredArray = self.listArray.filter { $0.listTitle!.lowercased().contains(searchText.lowercased()) }
            print("Workitem")
            DispatchQueue.main.async {
                completion(filteredArray)
            }
        }
        listWorkItem = filterWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: listWorkItem ?? filterWorkItem)
        print("Return will be executed later")
    }
    
}
