//
//  BookListEditUsecaseTests.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import XCTest

import Nimble

@testable import SWIFTUI_BookReview

class BookListEditUsecaseTests: XCTestCase {
    var usecase: BookListEditUsecase!
    
    override func setUp() {
        super.setUp()
        self.usecase = BookListEditUsecase(repository: BookListEditRepositoryMock())
    }
    
    override func tearDown() {
        self.usecase = nil
        BookListDummy.shared.refreshData()
        super.tearDown()
    }
    
    func test_데이터insert() {
        let data = BookSearchData(title: "나는 데이터", imgURL: nil, author: "author", price: "price", pubdate: "pubdate", isLiked: true)
        var answer = BookListDummy.shared.list
        answer.append(data)
        
        // 요청
        self.usecase.addBook(data)
        
        expect(BookListDummy.shared.list).to(
            equal(answer),
            description: "데이터는 같아야함"
        )
    }
    
    func test_데이터insert_isLiked가False_여도True로_insert() {
        let data = BookSearchData(title: "나는 데이터", imgURL: nil, author: "author", price: "price", pubdate: "pubdate", isLiked: false)
        var answer = BookListDummy.shared.list
        answer.append(data)
        
        // 요청
        self.usecase.addBook(data)
        
        expect(BookListDummy.shared.list).toNot(
            equal(answer),
            description: "데이터는 달라야함 isLiked가 True가 되어야함"
        )
    }
    
    func test_데이터_remove_id가_있을때() {
        let data = BookSearchData(title: "첫 번째 데이터", imgURL: nil, author: "author1", price: "price1", pubdate: "첫 번째 데이터", isLiked: false)
        var answer = BookListDummy.shared.list
        answer.remove(at: 0)
        
        // 요청
        self.usecase.removeBook(data)
        
        expect(BookListDummy.shared.list).to(
            equal(answer),
            description: "ID 값이 있는 경우 정상적으로 삭제 되어야 함"
        )
    }
    
    func test_데이터_remove_id가_없을때() {
        let data = BookSearchData(title: "100 번째 데이터", imgURL: nil, author: "author100", price: "price100", pubdate: "백 번째 데이터", isLiked: true)
        let answer = BookListDummy.shared.list
        
        // 요청
        self.usecase.removeBook(data)
        
        expect(BookListDummy.shared.list).to(
            equal(answer),
            description: "ID가 없는 경우 삭제되지 않아야 함"
        )
    }
}
