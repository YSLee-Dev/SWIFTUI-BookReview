//
//  BookSearchRepositoryMock.swift
//  SWIFTUI_BookReviewTests
//
//  Created by 이윤수 on 2023/06/19.
//

import Foundation

import Combine

@testable import SWIFTUI_BookReview

class BookSearchRepositoryMock: BookSearchRepositoryProtocol {
    func requestMoiveSearch(query: String) -> AnyPublisher<SWIFTUI_BookReview.BookSearchResponseDTO, Never> {
        let decodingData = try! JSONDecoder().decode(BookSearchResponseDTO.self, from: DummyLoad.searchDummyData)
        
        return Just<BookSearchResponseDTO>(decodingData)
            .eraseToAnyPublisher()
        
    }
}
