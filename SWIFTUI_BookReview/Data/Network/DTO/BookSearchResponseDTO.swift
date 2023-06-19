//
//  BookSearchResponseDTO.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

struct BookSearchResponseDTO: Decodable {
    var items: [Book]
    
    func toDomain() -> [BookSearchData] {
        self.items.map {
            BookSearchData(title: $0.title,
                            imgURL: URL(string: $0.image),
                            author: $0.author,
                            price: $0.discount,
                            pubdate: $0.pubdate,
                            isLiked: false
            )
        }
    }
}

struct Book: Decodable {
    let title: String
    let image: String
    let author: String
    let discount: String
    let pubdate: String
}
