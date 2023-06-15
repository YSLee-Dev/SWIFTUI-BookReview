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
    
    private var starList: [BookSearchData] = [
        .init(title: "1", imgURL: nil, author: "1", price: "1", pubdate: "1"),
        .init(title: "2", imgURL: nil, author: "2", price: "2", pubdate: "2"),
        .init(title: "3", imgURL: nil, author: "3", price: "3", pubdate: "3")
    ]
    
    @StateObject var viewModel = MainViewModel()
    @State private var tfText = ""
    @State private var isSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                if !isSearch {
                    ScrollView {
                        LazyVGrid(columns: item) {
                            ForEach(self.starList, id: \.id) { data in
                                NavigationLink {
                                    DetailView(book: data)
                                } label: {
                                    MainViewCell(book: data)
                                }

                            }
                        }
                    }
                } else {
                    List {
                        ForEach(self.viewModel.movieData, id: \.id) { data in
                            NavigationLink {
                                DetailView(book: data)
                            } label: {
                                Text(data.title)
                                    .font(.title3)
                                    .lineLimit(1)
                            }

                        }
                    }
                    .listStyle(.inset)
                }
            }
            .padding(20)
            .foregroundColor(Color.black)
                .navigationTitle("책 검색")
                .searchable(
                    text: $tfText,
                    placement: .navigationBarDrawer,
                    prompt: "책 이름을 검색하세요."
                )
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
