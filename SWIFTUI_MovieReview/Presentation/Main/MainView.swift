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
    
    @StateObject var viewModel = MainViewModel()
    @State private var tfText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MAIN")
                    .navigationTitle("책 검색")
                    .searchable(text: $tfText, prompt: "책 이름을 검색하세요.")
                    .onSubmit(of: .search) {
                        self.viewModel.tfValue.send(tfText)
                    }
                    .onChange(of: self.tfText) { _ in
                        if tfText.isEmpty && !isSearching {
                            print("종료")
                        }
                    }
                
                VStack {
                    ForEach(self.viewModel.movieData, id: \.id) {
                        Text($0.title)
                    }
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
