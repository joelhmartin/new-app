//
//  TopHeadlines.swift
//  news
//
//  Created by Joel Martin on 11/29/23.
//

import Foundation
import SwiftUI
import Kingfisher

struct TopHeadlines: View {
    
    @State private var selectedArticle: Article?
    @State private var showingSheet = false
    @EnvironmentObject var apiService: APIService

    let noImage = "https://upload.wikimedia.org/wikipedia/commons/c/c4/No_icon_red.svg"

    var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(apiService.topHeadlines.articles, id: \.publishedAt) { article in
                        if article.urlToImage != nil {
                            Button(action: {
                                selectedArticle = article
                                showingSheet.toggle()
                            }) {
                                TopHeadlineCell(article: article)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .background(.clear)
                            .sheet(isPresented: $showingSheet) {
                                SheetView(article: article).background(.black)
                            }
                        }
                    }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
            .onAppear{
                apiService.getTopHeadlines()
            }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let article: Article

    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                HStack {
                    Image(systemName: "arrow.down.app")
                    Text("Close")
                }
                Spacer()
            }
        }
        .frame(alignment: .leading)
        .font(.custom("Deutschlander", size: 30))
        .padding()
        .background(.black)
        .foregroundColor(.white)
        
        ArticleDetail(article: article)
    }
}

