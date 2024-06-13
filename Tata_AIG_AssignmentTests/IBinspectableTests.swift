//
//  IBinspectableTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest

@testable import Tata_AIG_Assignment

final class IBinspectableTests: XCTestCase {
    
    var mainView : UIView?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainView = UIView()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mainView = nil
    }
    
    // MARK: TEST_IBINSPECTABLES
    func testIBInspectables(){
        mainView?.borderColorr = UIColor.black
        mainView?.cornerRadius = 10
        mainView?.borderwidth = 1
        
        XCTAssertEqual(mainView?.layer.cornerRadius, mainView?.cornerRadius)
        XCTAssertEqual(mainView?.layer.borderWidth, mainView?.borderwidth)
        XCTAssertEqual(mainView?.layer.borderColor, mainView?.borderColorr.cgColor)
    }

}
