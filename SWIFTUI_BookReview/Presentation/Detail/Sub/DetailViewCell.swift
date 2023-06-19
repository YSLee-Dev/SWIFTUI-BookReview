//
//  DetailViewCell.swift
//  SWIFTUI_BookReview
//
//  Created by 이윤수 on 2023/06/15.
//

import SwiftUI

struct DetailViewCell: View {
    let title: String
    let contents: String
    
    var body: some View {
        HStack {
            Text(self.title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(
                    width: 80,
                    alignment: .leading
                )
            
            Text(self.contents)
                .font(.title3)
                .lineLimit(1)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct DetailViewCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCell(title: "책 이름", contents: "컨텐츠")
    }
}
