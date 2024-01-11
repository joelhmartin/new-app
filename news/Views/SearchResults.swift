//
//  SearchResults.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI

struct SearchResults: View {
    @EnvironmentObject var apiService: APIService
    let filteredArticles: [Article]
        
    var body: some View {
        if !filteredArticles.isEmpty {
            NavigationView {
                List {
                    ForEach(filteredArticles, id: \.publishedAt) { article in
                        SearchResultRow(article: article)
                    }
                    .listRowBackground(Color.black)
                    .listRowInsets(.none)
                    .listRowSeparatorTint(Color.white)
                }
                .refreshable {
                    apiService.getAll()
                }
                .onAppear {
                    apiService.getAll()
                }
                .background(.black)
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            }
            .accentColor(.white)
        } else {
            Exclamation(text: "No Results")
        }

    }
}
