//
//  HomeViewModelTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest

@testable import Tata_AIG_Assignment

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: TEST_GET_DATA_FROM_LOCAL_DB_COREDATA
    func testGetAllData() {
        var testArray : [ListModel] = []
        testArray = viewModel.getListsData()
        XCTAssertEqual(testArray.count, viewModel.getListsData().count)
    }
   

    // MARK: TEST_FILETER_DATA
    func testFilterData() {
        // Given
        let searchText = "test"
        let testListArray = [ListModel(listImage: "testImage", listTitle: "Test Title")]
        viewModel.listArray = testListArray
        let expectation = XCTestExpectation(description: "Data Filtered")

        // When
        viewModel.filterData(searchText: searchText) { filteredArray in
            // Then
            XCTAssertEqual(filteredArray.count, 1)
            XCTAssertEqual(filteredArray.first?.listTitle, testListArray.first?.listTitle)
            expectation.fulfill()
        }
    }
}

