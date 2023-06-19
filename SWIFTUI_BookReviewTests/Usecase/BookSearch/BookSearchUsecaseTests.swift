//
//  BookSearchUsecaseTests.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import XCTest

import Combine
import Nimble

@testable import SWIFTUI_BookReview

class BookSearchUsecaseTests: XCTestCase {
    var usecase: BookSearchUsecaseProtocol!
    var failureUsecase: BookSearchUsecaseProtocol!
    
    var bag = Set<AnyCancellable>()
    
    override func setUp() {
        self.usecase = BookSearchUsecase(repository: BookSearchRepositoryMock())
        self.failureUsecase = BookSearchUsecase(repository: BookSearchRepositoryFailureMock())
    }
    
    override func tearDown() {
        self.usecase = nil
        self.failureUsecase = nil
        self.bag = []
    }
    
    func test_네트워크_작업이_완료된_객체_DTO() {
        let answer: [BookSearchData] = bookSearchDataDummy
        let resultCombine = self.usecase.bookSearch(query: "겨울왕국")
        
        var result: [BookSearchData] = []
        
        resultCombine
            .sink(receiveValue: {
                result = $0
            })
            .store(in: &bag)
        
        expect(result).to(
            equal(answer),
            description: "2차 DTO된 값도 동일해야함"
        )
    }
    
    func test_네트워크_작업이_완료되지_않았을때_객체_DTO() {
        let answer: [BookSearchData] = []
        let resultCombine = self.failureUsecase.bookSearch(query: "겨울왕국")
        
        var result: [BookSearchData] = []
        
        resultCombine
            .sink(receiveValue: {
                result = $0
            })
            .store(in: &bag)
        
        expect(result).to(
            equal(answer),
            description: "만약 데이터가 없으면 빈 배열을 반환해야함"
        )
    }
}
