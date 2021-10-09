//
//  NIBMSWIFTUI9Tests.swift
//  NIBMSWIFTUI9Tests
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import XCTest
@testable import NIBMSWIFTUI9

class NIBMSWIFTUI9Tests: XCTestCase {
    
    var sut: HomeViewModel!
    var loginSut: SignUpDataService!

    // First Run ( setup the values / intializeing values )
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeViewModel(homeDataService: MockHomeDataService())
    }

    // finally Run ( deintilizing and setup to null value )
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // Second Run ( All Functions )
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(sut.shoppingItems.isEmpty)   // This is checking at the begging ShoppingCart array is Empty
        
        // HERE TEST getHomeData function
        sut.getHomeData()
        
        // VALUE EXPRESSIONONE AND EXPRESSIONTWO CHECK THESE VALUES ARE EQUAL ( IN THIS CODE THAT 1 OBJECT CAME ON MockHomeDataService.loadData )
        XCTAssertEqual(sut.shoppingItems.count, 1)
        
        //XCTAssertEqual OVERRIDE WITH CUSTOM MESSAGE
//        XCTAssertEqual(sut.shoppingItems.count, 2, "Value Not matching please match value")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockHomeDataService: HomeDataService {
    func loadData(completion:@escaping ([ShoppingItem]) -> ()){
        completion([ShoppingItem(productName: "Burger", calories: "123 cal", price: 234, description: "Burger superb with cheese", imageUrl: "htttp.ad.com")])
    }
}
class MockSignUpDataService: SignUpDataService {
    func signUpFun(name: String, email: String, phone_number: String, password: String){
        
    }

}

// In the code coverage codecoverage are shows how much number of code coverage in this test 
