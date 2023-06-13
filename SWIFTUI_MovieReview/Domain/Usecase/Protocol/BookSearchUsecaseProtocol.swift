//
//  BookSearchUsecaseProtocol.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

import Combine

protocol BookSearchUsecaseProtocol {
    func bookSearch(query: String) -> AnyPublisher<[BookSearchData], Never>
}
