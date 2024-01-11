//
//  NewsData.swift
//  news-viewer
//
//  Created by Joel Martin on 11/7/23.
//

import Foundation

// I learned interfaces and typescript in a React course by CodeWithMosh
struct Results: Codable {
    let status: String
    let totalResults: Int
    var articles: [Article]
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let country: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
