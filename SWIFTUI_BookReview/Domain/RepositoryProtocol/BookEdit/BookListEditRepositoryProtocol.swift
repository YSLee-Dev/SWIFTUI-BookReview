//
//  BookListEditRepositoryProtocol.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

protocol BookListEditRepositoryProtocol {
    func removeSaveBookList(_ id: String)
    func addSaveBookList(_ book: BookSearchData)
}
