//
//  NewsAPI.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation

// Article model conforming to Identifiable and Codable protocols
struct Article: Identifiable, Codable {
    let id = UUID() // Unique identifier for each article
    let title: String // Title of the article
    let description: String? // Optional description of the article
    let content: String? // Optional content of the article
    let url: String // URL of the article
    let urlToImage: String? // Optional URL of the article's image
}

// NewsAPI class to handle fetching news from the API
class NewsAPI {
    static let shared = NewsAPI() // Singleton instance of NewsAPI
    private let apiKey = "c4c2cc2c8f614844b95f3d1efb8cc829" // API key for accessing the news API
    private let baseUrl = "https://newsapi.org/v2" // Base URL for the news API

    // Function to fetch news articles based on the specified category
    func fetchNews(category: String = "general", completion: @escaping ([Article]) -> Void) {
        // Construct the URL for fetching news articles
        let url = URL(string: "\(baseUrl)/top-headlines?country=in&category=\(category)&apiKey=\(apiKey)")!

        // Create a data task to fetch the news articles
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder() // Create a JSON decoder
                // Try to decode the response into a NewsResponse object
                if let newsResponse = try? decoder.decode(NewsResponse.self, from: data) {
                    // Dispatch the completion handler on the main thread
                    DispatchQueue.main.async {
                        completion(newsResponse.articles) // Pass the articles to the completion handler
                    }
                }
            }
        }.resume() // Start the data task
    }
}

// NewsResponse model to decode the API response
struct NewsResponse: Codable {
    let articles: [Article] // Array of articles in the response
}
