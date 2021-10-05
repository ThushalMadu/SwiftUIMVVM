//
//  NIBMSWIFTUI9UITests.swift
//  NIBMSWIFTUI9UITests
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import XCTest

class NIBMSWIFTUI9UITests: XCTestCase {

    var app:XCUIApplication! // USING ! MARK DONT NEED INITILIZER THAT MEAN INITIZER IS SOME WHERE
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
        
        // Text Title Exists
        let component_TextTile = app.staticTexts["Component_TextTile"]
        XCTAssertTrue(component_TextTile.exists,"Text View is Not exists")

        // Text View Exists
        let component_TextView = app.textFields["Component_TextView"]
        XCTAssertTrue(component_TextView.exists,"TextField is Not exists")
        
        // Button Exists
        let component_Button = app.buttons["Component_Button"]
        XCTAssertTrue(component_Button.exists,"Button is Not exists")
        app.scrollViews.otherElements.buttons["Already Have an account? Sign In"].tap()
        // we can write continously with these auto test cases and test these ui elements are working to run click that ui get value and give them
    }
}
