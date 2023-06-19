//
//  BookAPI.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/12.
//

import Foundation

struct BookAPI {
    static let scheme = "https"
    static let host = "openapi.naver.com"
    static let path = "/v1/search/book.json"

    func getMovieListComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = BookAPI.scheme
        components.host = BookAPI.host
        components.path = BookAPI.path
        
        return components
    }
}
