//
//  MovieSearchData.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

struct BookSearchData: Identifiable, Hashable {
    var id: String {
        UUID().uuidString
    }
    
    let title: String
    let imgURL: URL?
    let author: String
    let price: String
    let pubdate: String
}
