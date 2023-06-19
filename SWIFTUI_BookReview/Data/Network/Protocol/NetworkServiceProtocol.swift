//
//  NetworkServiceProtocol.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/12.
//

import Foundation

import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(decodingType: T.Type, param: String) -> AnyPublisher<T, URLError>
}
