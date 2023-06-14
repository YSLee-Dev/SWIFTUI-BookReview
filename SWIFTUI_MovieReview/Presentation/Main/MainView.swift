//
//  MainView.swift
//  SWIFTUI_MovieReview
//
//  Created by 이윤수 on 2023/06/13.
//

import SwiftUI

struct MainView: View {
    @Environment(\.isSearching) private var isSearching: Bool
    @Environment(\.dismissSearch) private var dismissSearch
    
    var item: [GridItem] {
        Array(repeating: .init(.flexible()), count: 2)
    }
    
    @StateObject var viewModel = MainViewModel()
    @State private var tfText = ""
    @State private var isSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: item) {
                        ForEach(self.viewModel.movieData, id: \.id) {
                            MainViewCell(book: $0)
                        }
                    }
                }
                .padding(20)
                    .navigationTitle("책 검색")
                    .searchable(text: $tfText, prompt: "책 이름을 검색하세요.")
                    .onSubmit(of: .search) {
                        self.viewModel.tfValue.send(tfText)
                        self.isSearch = true
                    }
                    .onChange(of: self.tfText) { _ in
                        if tfText.isEmpty && !isSearching {
                            print("종료")
                            self.isSearch = false
                        }
                    }
                if isSearch {
                    List {
                        ForEach(self.viewModel.movieData, id: \.id) { data in
                            Text(data.title)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                    .listStyle(.inset)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
