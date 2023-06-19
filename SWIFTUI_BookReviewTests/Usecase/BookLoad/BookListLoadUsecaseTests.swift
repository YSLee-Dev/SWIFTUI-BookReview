//
//  BookListLoadUsecaseTests.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import XCTest

import Combine
import Nimble

@testable import SWIFTUI_BookReview

final class BookListLoadUsecaseTests: XCTestCase {
    var usecase: BookListLoadUsecase!
    var bag = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        self.usecase = BookListLoadUsecase(repository: BookListLoadRepositoryMock())
    }
    
    override func tearDown() {
        self.usecase = nil
        super.tearDown()
    }
    
    func test_저장된리스트파일이_Just형태로_리턴되는지_확인() {
        let answer = Just<[BookSearchData]>(BookListDummy.shared.list).self
        let result = self.usecase.loadList().self
        
        expect(answer).to(
            equal(result),
            description: "리턴되는 타입은 JUST<[BookSearchData]이여야 함>"
            )
    }
}
