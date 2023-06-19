//
//  BookList.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

class BookList {
    private init() {}
    
    static var shared = BookList()
    
    var saveList: [BookSearchData] = [] {
        didSet {
            print(self.saveList)
            
            UserDefaults.standard.set(
                try? PropertyListEncoder().encode(self.saveList),
                forKey: UserDefaults.Key.book.rawValue
            )
        }
    }
}
