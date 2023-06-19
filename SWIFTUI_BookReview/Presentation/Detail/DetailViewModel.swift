//
//  DetailViewModel.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import Foundation

import Combine

class DetailViewModel {
    var book: BookSearchData?
    let starBtnTap = PassthroughSubject<Bool, Never>()
    
    private let usecase: BookListEditUsecaseProtocol
    var bag = Set<AnyCancellable>()
    
    init(
        usecase: BookListEditUsecaseProtocol = BookListEditUsecase()
    ) {
        self.usecase = usecase
        
        self.starBtnTap
            .filter {
                $0
            }
            .sink(receiveValue: {[weak self] _ in
                self?.usecase.addBook(self?.book)
            })
            .store(in: &bag)
        
        self.starBtnTap
            .filter {
                !$0
            }
            .sink(receiveValue: {[weak self] _ in
                self?.usecase.removeBook(self?.book)
            })
            .store(in: &bag)
    }
}
