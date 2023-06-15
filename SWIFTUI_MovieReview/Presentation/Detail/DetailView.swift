//
//  DetailView.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let book: BookSearchData
    
    private var bookArray: [String] {
        [self.book.author, self.book.price, self.book.pubdate]
    }
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(self.book.imgURL)
                    .placeholder {
                        Image(systemName: "person.crop.artframe")
                            .resizable()
                            .frame(
                                width: UIScreen.main.bounds.width - 32,
                                height: UIScreen.main.bounds.width - 32
                            )
                    }
                    .resizable()
                    .frame(
                        width: UIScreen.main.bounds.width - 32,
                        height: UIScreen.main.bounds.width - 32
                    )
                    .aspectRatio(contentMode: .fit)
                    .navigationTitle(self.book.title)
                
                ForEach(
                    Array(DetailViewCellTitle.allCases.enumerated()),
                    id: \.element.rawValue
                ) { row, data in
                    DetailViewCell(title: data.rawValue, contents: self.bookArray[row] )
                }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(title: "title", imgURL: nil, author: "author", price: "price", pubdate: "pubdate"))
    }
}
