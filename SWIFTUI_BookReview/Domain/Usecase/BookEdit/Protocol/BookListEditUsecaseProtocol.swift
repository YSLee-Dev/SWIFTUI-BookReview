//
//  BookListEditUsecaseProtocol.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

protocol BookListEditUsecaseProtocol {
    func removeBook(_ book: BookSearchData?)
    func addBook(_ book: BookSearchData?)
}
