//
//  BookListEditRepository.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

class BookListEditRepository: BookListEditRepositoryProtocol {
    func removeSaveBookList(_ id: String) {
        for item in BookList.shared.saveList.enumerated() where item.element.id == id {
           BookList.shared.saveList.remove(at: item.offset)
        }
    }
    
    func addSaveBookList(_ book: BookSearchData) {
        BookList.shared.saveList.append(book)
    }
}
