//
//  URLSessionProtocol.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/12.
//

import Foundation

import Combine

protocol URLSessionProtocol {
    func dataTaskPublisher(request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionProtocol {
    func dataTaskPublisher(request: URLRequest) -> URLSession.DataTaskPublisher {
        self.dataTaskPublisher(for: request)
    }
}
