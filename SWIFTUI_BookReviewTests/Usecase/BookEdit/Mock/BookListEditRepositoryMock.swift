//
//  BookListEditRepositoryMock.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import Foundation

@testable import SWIFTUI_BookReview

class BookListEditRepositoryMock: BookListEditRepositoryProtocol {
    func removeSaveBookList(_ id: String) {
        for item in BookListDummy.shared.list.enumerated() where item.element.id == id {
            BookListDummy.shared.list.remove(at: item.offset)
        }
    }
    
    func addSaveBookList(_ book: SWIFTUI_BookReview.BookSearchData) {
        BookListDummy.shared.list.append(book)
    }
}
