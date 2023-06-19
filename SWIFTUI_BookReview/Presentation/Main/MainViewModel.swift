//
//  MainViewModel.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

import Combine

class MainViewModel: ObservableObject {
    @Published var bookDataList: [BookSearchData] = []
    @Published var saveBookList: [BookSearchData] = []
    
    let tfValue = PassthroughSubject<String, Never>()
    let homeRefresh = PassthroughSubject<Void, Never>()
    
    private let bookSearchUsecase: BookSearchUsecaseProtocol
    private let bookLoadUsecase: BookListLoadUsecaseProtocol
    
    init(
        usecase: BookSearchUsecaseProtocol = BookSearchUsecase(),
        loadUsecase: BookListLoadUsecaseProtocol = BookListLoadUsecase()
    ) {
        self.bookSearchUsecase = usecase
        self.bookLoadUsecase = loadUsecase
        
        self.tfValue
            .map {[weak self] data in
                guard let self = self else {return Just<[BookSearchData]>([]).eraseToAnyPublisher()}
                return self.bookSearchUsecase.bookSearch(query: data)
            }
            .switchToLatest()
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: &self.$bookDataList)
        
        self.homeRefresh
            .eraseToAnyPublisher()
            .map {[weak self] _ in
                guard let self = self else {return Just<[BookSearchData]>([])}
                return self.bookLoadUsecase.loadList()
            }
            .switchToLatest()
            .eraseToAnyPublisher()
            .assign(to: &self.$saveBookList)
    }
}
