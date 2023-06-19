//
//  BookListEditUsecase.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

class BookListEditUsecase: BookListEditUsecaseProtocol {
    let repository: BookListEditRepositoryProtocol
    
    init(
        repository: BookListEditRepositoryProtocol = BookListEditRepository()
    ) {
        self.repository = repository
    }
    
    func removeBook(_ book: BookSearchData?) {
        guard let bookID = book?.id else {return}
        self.repository.removeSaveBookList(bookID)
    }
    
    func addBook(_ book: BookSearchData?) {
        guard let book = book else {return}
        let liked = BookSearchData(
            title: book.title,
            imgURL: book.imgURL,
            author: book.author,
            price: book.price,
            pubdate: book.pubdate,
            isLiked: true
        )
        
        self.repository.addSaveBookList(liked)
    }
}
