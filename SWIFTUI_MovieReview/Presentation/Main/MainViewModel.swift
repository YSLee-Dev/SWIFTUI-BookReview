//
//  MainViewModel.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import Foundation

import Combine

class MainViewModel: ObservableObject {
    @Published var movieData: [BookSearchData] = []
    
    let usecase: BookSearchUsecaseProtocol
    
    let tfValue = PassthroughSubject<String, Never>()
    
    init(
        usecase: BookSearchUsecase = .init()
    ) {
        self.usecase = usecase
        
        self.tfValue
            .map {[weak self] data in
                guard let self = self else {return Just<[BookSearchData]>([]).eraseToAnyPublisher()}
                return self.usecase.bookSearch(query: data)
            }
            .switchToLatest()
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: &self.$movieData)
    }
}
