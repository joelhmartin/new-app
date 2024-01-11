//
//  APIService.swift
//  news
//
//  Created by Joel Martin on 11/29/23.
//

/*
 I found out too late that the API had restrictions on
 what you can get. In order to call "everything" instead of
 top-headlines you were forced to provide a query which
 i couldn't work into the logic in time. which is why 'getAll'
 and 'topHeadlines' return the same data
 */

import Foundation
import SwiftUI

class APIService: ObservableObject {
    let apiKey = "487bbdf59b98442b8213fa1b73f78e2b"
    var country: String? = "us"
   
    @Published var allArticles: Results = Results(status: "Loading", totalResults: 0, articles: [])
    @Published var topHeadlines: Results = Results(status: "Loading", totalResults: 0, articles: [])
    
    private func fetchData(for endpoint: String, completion: @escaping (Results) -> Void) {
        guard let url = buildURL(for: endpoint) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Results.self, from: data)
                        completion(decodedData)
                    } catch {
                        print("Error decoding data for \(endpoint)")
                    }
                }
            }
        }.resume()
    }
    
    private func buildURL(for endpoint: String) -> URL? {
        let countryString = "?country=\(country ?? "us")"
        let urlString = "https://newsapi.org/v2/\(endpoint)\(countryString)&apiKey=\(apiKey)"
        return URL(string: urlString)
    }
    
    func getAll() {
        fetchData(for: "top-headlines") { data in
            self.allArticles = data
        }
    }

    func getTopHeadlines() {
        fetchData(for: "top-headlines") { data in
            self.topHeadlines = data
        }
    }
}
