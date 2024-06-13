//
//  APIErrorTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest

@testable import Tata_AIG_Assignment

final class APIErrorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: TEST_EMPTY_URL_API_ERROR_CASE

    func testEmptyURLAPIError(){
        let url = URL(string: "")
        guard let validURL = url else{
            print(AppErrors.invalidURL.localizedDescription)
            return
        }
        APIManager.shared.baseRequestApi(validURL, .get) { (result: MoviesModel?) in
            print(result)
        }
    }
    
    // MARK: TEST_INVALID_URL_API_ERROR_CASE
    
    func testAPIError(){
        let url = URL(string: "https://www.google.co.in/")
        APIManager.shared.baseRequestApi(url!, .get) { (result: MoviesModel?) in
            print(result)
        }
    }


}
