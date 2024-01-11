//
//  ArticleDetail.swift
//  news
//
//  Created by Joel Martin on 11/30/23.
//

import Foundation
import SwiftUI

struct ArticleDetail: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .center) {
            Text(article.title ?? "No title")
                .font(.custom("Deutschlander", size: 40))
                .fontWeight(.bold)
                .tracking(1)
            Text(article.description ?? "")
                .padding()
            Spacer()
    
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 50)
                Link("View full article", destination: URL(string: article.url ?? "")!)
            }

        }
        .padding(.horizontal, 30.0)
        .background(.black)
        .foregroundColor(.white)
    }
}
