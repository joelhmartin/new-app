//
//  HeadLineRowView.swift
//  news
//
//  Created by Joel Martin on 11/29/23.
//

import Foundation
import SwiftUI

struct SearchDisplay: View {
    @State private var savedIsOn: Bool = false
    @State private var searchText = ""
    @EnvironmentObject var apiService: APIService
    
    var filteredArticles: [Article] {
        let results = apiService.allArticles.articles
        return results.filter { article in
            
            if searchText.isEmpty {
                return true
            } else {
                return
                    (article.title?.range(of: searchText, options: .caseInsensitive) != nil)
            }
        }
    }
    
    var body: some View {
        VStack {
            // Links
            if apiService.allArticles.status == "ok" {
                
                SearchBar(searchText: $searchText, savedIsOn: $savedIsOn)
                
                SearchResults(filteredArticles: filteredArticles)

            } else {
                Exclamation(text: "Loading")
            }
        }
        .onAppear(perform: apiService.getAll)
        .refreshable {apiService.getAll()}
    }
}
