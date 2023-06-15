//
//  BookSearchUsecase.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

import Combine

class BookSearchUsecase: BookSearchUsecaseProtocol {
    let repository: BookSearchRepositoryProtocol
    
    init(
        repository: BookSearchRepositoryProtocol = BookSearchRepository()
    ) {
        self.repository = repository
    }
    
    func bookSearch(query: String) -> AnyPublisher<[BookSearchData], Never> {
        self.repository.requestMoiveSearch(query: query)
            .map {
                $0.toDomain()
            }
            .eraseToAnyPublisher()
    }
}
