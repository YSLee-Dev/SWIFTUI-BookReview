//
//  MainViewCell.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/14.
//

import SwiftUI

import Kingfisher

struct MainViewCell: View {
    let book: BookSearchData
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(self.book.imgURL)
                .placeholder {
                    Image(systemName: "person.crop.artframe")
                        .resizable()
                        .frame(
                            width: (UIScreen.main.bounds.width / 2) - 40,
                            height: (UIScreen.main.bounds.width / 2) - 40
                        )
                }
                .resizable()
                .frame(
                    width: (UIScreen.main.bounds.width / 2) - 40,
                    height: (UIScreen.main.bounds.width / 2) - 40
                )
                .padding(8)
            
            Text(book.title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            
            Text("💰\(book.price)")
                .font(.title3)
                .font(.callout)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
        .overlay {
            RoundedRectangle(cornerRadius: CGFloat(12.0))
                .stroke(Color.gray)
                .shadow(radius: 2)
        }
        
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(book: .init(title: "BOOK", imgURL: nil, author: "author", price: "12,300", pubdate: "2023.06.14", isLiked: true))
    }
}
