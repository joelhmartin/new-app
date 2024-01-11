//
//  TopHeadlineCell.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI
import Kingfisher

struct TopHeadlineCell: View {
    let article: Article
    
    var body: some View {
        
        HStack(spacing: -23.0) {
            ZStack {
                Rectangle()
                    .frame(width: 360.0, height: 210)
                KFImage(URL(string: article.urlToImage ?? noImage))
                    .resizable()
                    .frame(width: 360.0, height: 200)
                    .scaledToFill()
                    .mask( LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                    )
                TopHeadlineCaption(text: article.title ?? "")
            }
        }
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1)
    }
}
