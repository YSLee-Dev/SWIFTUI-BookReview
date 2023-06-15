//
//  BookListLoadUsecase.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

import Combine

class BookListLoadUsecase: BookListLoadUsecaseProtocol {
    let repository: BookListLoadRepositoryProtocol
    
    init(
        repository: BookListLoadRepositoryProtocol = BookListLoadRepository()
    ) {
        self.repository = repository
    }
    
    func loadList() -> Just<[BookSearchData]> {
        Just<[BookSearchData]>(self.repository.loadBookList())
    }
}
