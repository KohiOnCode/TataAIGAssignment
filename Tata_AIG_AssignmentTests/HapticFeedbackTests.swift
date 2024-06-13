//
//  HapticFeedbackTests.swift
//  Tata_AIG_AssignmentTests
//
//  Created by Kohinoor on 12/06/24.
//

import XCTest
@testable import Tata_AIG_Assignment

class HapticFeedbackTests: XCTestCase {
    
    var viewController: UIViewController!
    
    override func setUpWithError() throws {
        viewController = UIViewController()
        viewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    // MARK: TEST_HAPTIC_METHOD
    
    func testAddHapticFeedback() {
        viewController.addHapticFeedback()
            XCTAssertTrue(viewController.traitCollection.forceTouchCapability == .unavailable)
    }
}
