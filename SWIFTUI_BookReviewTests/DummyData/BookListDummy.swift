//
//  BookListMock.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import Foundation

@testable import SWIFTUI_BookReview

class BookListDummy {
    private init() {}
    static let shared = BookListDummy()
    
    var list: [BookSearchData] = [
        BookSearchData(title: "첫 번째 데이터", imgURL: nil, author: "author1", price: "price1", pubdate: "첫 번째 데이터", isLiked: false),
        BookSearchData(title: "두 번째 데이터", imgURL: nil, author: "author2", price: "price2", pubdate: "두 번째 데이터", isLiked: true),
        BookSearchData(title: "세 번째 데이터", imgURL: nil, author: "author3", price: "price3", pubdate: "세 번째 데이터", isLiked: true),
    ]
    
    func refreshData() {
        self.list = [
            BookSearchData(title: "첫 번째 데이터", imgURL: nil, author: "author1", price: "price1", pubdate: "첫 번째 데이터", isLiked: false),
            BookSearchData(title: "두 번째 데이터", imgURL: nil, author: "author2", price: "price2", pubdate: "두 번째 데이터", isLiked: true),
            BookSearchData(title: "세 번째 데이터", imgURL: nil, author: "author3", price: "price3", pubdate: "세 번째 데이터", isLiked: true)
        ]
    }
}
