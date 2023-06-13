//
//  BookSearchRepository.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

import Combine

class BookSearchRepository: BookSearchRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    init
    (
        service: NetworkService =  .init()
    ) {
        self.networkService = service
    }
    
    func requestMoiveSearch(query: String) -> AnyPublisher<BookSearchResponseDTO, Never> {
        self.networkService.request(decodingType: BookSearchResponseDTO.self, param: query)
            .catch { error in
                print(error)
                return Just<BookSearchResponseDTO>(BookSearchResponseDTO(items: []))
            }
            .eraseToAnyPublisher()
    }
}
