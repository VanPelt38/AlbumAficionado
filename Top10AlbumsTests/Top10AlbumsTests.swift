//
//  Top10AlbumsTests.swift
//  Top10AlbumsTests
//
//  Created by Jake Gordon on 25/07/2023.
//

import XCTest
@testable import Top10Albums


final class Top10AlbumsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//MARK: - Welcome Tests
    
    // ID Generator Tests
    
    func testIDGeneratorReturnsCorrectStringLength() {
        
        let welcomeModel = WelcomeViewModel()
        let id = welcomeModel.IDgenerator()
        XCTAssertEqual(id.count, 12)
    }
    
    func testIDGeneratorReturnsDifferentStringEachTime() {
        
        let welcomeModel = WelcomeViewModel()
        let firstCall = welcomeModel.IDgenerator()
        let secondCall = welcomeModel.IDgenerator()
        XCTAssertNotEqual(firstCall, secondCall)
    }
    
    func testIDGeneratorResultContainsOnlyCorrectCharacters() {
        
        var isItThere = true
        let welcomeModel = WelcomeViewModel()
        let result = welcomeModel.IDgenerator()
        let characters = Set(K.passwordCharacters)
        for char in result {
            if !characters.contains(char) {
                isItThere = false
            }
        }
        XCTAssertTrue(isItThere)
    }

}
