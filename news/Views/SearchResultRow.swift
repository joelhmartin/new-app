//
//  SearchResultRow.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI
import Kingfisher

struct SearchResultRow: View {
    let article: Article
    
    var body: some View {
        NavigationLink(destination: ArticleDetail(article: article)) {
            HStack {
                KFImage(URL(string: article.urlToImage ?? noImage))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 1))
                    .shadow(color: Color.gray, radius: 9)
                Caption(text: article.title ?? "").frame(width: 250)
            }
        }
    }
}
