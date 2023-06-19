//
//  BookListLoadRepositoryMock.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import Foundation

@testable import SWIFTUI_BookReview

class BookListLoadRepositoryMock: BookListLoadRepositoryProtocol {
    func loadBookList() -> [SWIFTUI_BookReview.BookSearchData] {
        BookListDummy.shared.list
    }
}
