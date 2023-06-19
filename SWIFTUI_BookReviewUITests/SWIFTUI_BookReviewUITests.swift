//
//  SWIFTUI_BookReviewUITests.swift
//  SWIFTUI_BookReviewUITests
//
//  Created by 이윤수 on 2023/06/19.
//

import XCTest

final class SWIFTUI_BookReviewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func test_navigationBar의_title이_책검색으로_설정되어있다() {
        let existNavigationBar = app.navigationBars["책 검색"].exists
        XCTAssertTrue(existNavigationBar)
    }
    
    func test_navigationBar의_searchBar가_존재한다() {
        let existSearchBar = app.navigationBars["책 검색"]
            .searchFields["책 이름을 검색하세요."]
            .exists
        
        XCTAssertTrue(existSearchBar)
    }
    
    func test_searchBar에_cancel버튼이_존재한다() {
        let navigationBar = app.navigationBars["책 검색"]
        
        navigationBar
            .searchFields["책 이름을 검색하세요."]
            .tap()
        
        let existSearchBarCancelBtn = navigationBar
            .buttons["Cancel"]
            .exists
    }
}
