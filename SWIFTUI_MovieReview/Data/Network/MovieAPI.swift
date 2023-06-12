//
//  MovieAPI.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/12.
//

import Foundation

struct MovieAPI {
    static let scheme = "https"
    static let host = "openapi.naver.com/"
    static let path = "/v1/search/movie.json"

    func getMovieListComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = MovieAPI.scheme
        components.host = MovieAPI.host
        components.path = MovieAPI.path
        
        return components
    }
}
