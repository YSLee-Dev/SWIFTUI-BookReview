//
//  BookListLoadRepository.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

class BookListLoadRepository: BookListLoadRepositoryProtocol {
    func loadBookList() -> [BookSearchData] {
        BookList.shared.saveList = (
            try? PropertyListDecoder().decode(
                [BookSearchData].self,
                from: UserDefaults.standard.data(forKey: UserDefaults.Key.book.rawValue) ?? .empty
            )
        ) ?? []
        return BookList.shared.saveList
    }
}
