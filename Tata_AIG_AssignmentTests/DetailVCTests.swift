//
//  DetailVCTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest
@testable import Tata_AIG_Assignment 

class DetailVCTests: XCTestCase {
    
    var detailVC: DetailVC!

    override func setUpWithError() throws {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        detailVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        detailVC = nil
    }

    // MARK: TEST_SETUP_UI_ON_VALID_DATA
    func testSetupUI_WithValidData() {
        let list = ListModel(listImage: "valid_image_url", listTitle: "Title")
        
        detailVC.list = list
        detailVC.setupUI()
        
        XCTAssertEqual(detailVC.detailLbl.text, "Title")
    }

    // MARK: TEST_SETUP_UI_ON_NIL_DATA
    func testSetupUI_WithNilData() {
        let list: ListModel? = nil
        
        detailVC.list = list
        detailVC.setupUI()
        let alertMessage = "Nil Data"
        detailVC.ShowAlert(mesaage: alertMessage)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            let alertController = self.detailVC.presentedViewController as? UIAlertController
            XCTAssertNotNil(alertController)
            XCTAssertEqual(alertController?.title, "Alert")
            XCTAssertEqual(alertController?.message, alertMessage)
            XCTAssertEqual(alertController?.actions.count, 1)
            XCTAssertEqual(alertController?.actions.first?.title, "OK")
            XCTAssertEqual(alertController?.actions.first?.style, .default)
        }
        
        XCTAssertNil(detailVC.detailLbl.text)
    }
    
    
}
