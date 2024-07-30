//
//  NewsAPI.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation

struct Article: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String?
    let content: String?
    let url: String
    let urlToImage: String?
}

class NewsAPI {
    static let shared = NewsAPI()
    private let apiKey = "c4c2cc2c8f614844b95f3d1efb8cc829"
    private let baseUrl = "https://newsapi.org/v2"

    func fetchNews(category: String = "general", completion: @escaping ([Article]) -> Void) {
        let url = URL(string: "\(baseUrl)/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let newsResponse = try? decoder.decode(NewsResponse.self, from: data) {
                    DispatchQueue.main.async {
                        completion(newsResponse.articles)
                    }
                }
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [Article]
}
