//
//  HomeVCTextFieldDelegateTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest

@testable import Tata_AIG_Assignment

class HomeVCTextFieldDelegateTests: XCTestCase {
    
    var homeVC: HomeVC!
    var textField: UITextField!
    
    override func setUp() {
        super.setUp()
        homeVC = HomeVC()
        textField = UITextField()
    }
    
    override func tearDown() {
        homeVC = nil
        textField = nil
        super.tearDown()
    }
    
    // MARK: TEST_TEXTFIELD_RESIGN_DELEGATE
    
    func testTextFieldShouldReturn() {
        XCTAssertTrue(homeVC.textFieldShouldReturn(textField), "textFieldShouldReturn should return true")
        XCTAssertFalse(textField.isFirstResponder, "Text field should resign first responder")
    }
    
    
}
