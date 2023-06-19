//
//  BookSearchRepositoryFailureMock.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import Foundation

import Combine

@testable import SWIFTUI_BookReview

class BookSearchRepositoryFailureMock: BookSearchRepositoryProtocol {
    func requestMoiveSearch(query: String) -> AnyPublisher<SWIFTUI_BookReview.BookSearchResponseDTO, Never> {
        return Just<BookSearchResponseDTO>(BookSearchResponseDTO(items: []))
            .eraseToAnyPublisher()
        
    }
}
