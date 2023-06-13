//
//  NetworkService.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/12.
//

import Foundation

import Combine

class NetworkService: NetworkServiceProtocol {
    let session: URLSessionProtocol
    let bookAPI: BookAPI
    init(
        session: URLSession = .shared,
        movieApi: BookAPI = .init()
    ) {
        self.session = session
        self.bookAPI = movieApi
    }

    func request<T>(decodingType: T.Type, param: String) -> AnyPublisher<T, URLError> where T: Decodable {
        var urlComponents = bookAPI.getMovieListComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: param)
        ]
        
        guard let url = urlComponents.url else {return Fail(error: URLError(.badURL)).eraseToAnyPublisher()}
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        let header: [[String: String]] = [
            ["X-Naver-Client-Id": RequestToken.id],
            ["X-Naver-Client-Secret": RequestToken.secret]
        ]
        
        for item in header {
            for keyValue in item {
                urlRequest.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
            }
        }
        
        return self.session.dataTaskPublisher(request: urlRequest)
            .tryMap { data, response in
                guard let httpReponse = response as? HTTPURLResponse else {throw URLError(.unknown)}
                
                switch httpReponse.statusCode {
                case 200 ..< 300:
                    return data
                case 400 ..< 500:
                    throw URLError(.clientCertificateRejected)
                case 500 ..< 600:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: decodingType, decoder: JSONDecoder())
            .mapError {
                $0 as? URLError ?? URLError(.unknown)
            }
            .eraseToAnyPublisher()
    }
}
