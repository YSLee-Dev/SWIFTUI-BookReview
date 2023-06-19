//
//  BookListLoadUsecaseProtocol.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

import Combine

protocol BookListLoadUsecaseProtocol {
    func loadList() -> Just<[BookSearchData]>
}
