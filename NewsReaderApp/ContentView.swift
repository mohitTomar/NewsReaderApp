//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var articles: [Article] = []
    @State private var category: String = "general"

    var body: some View {
        NavigationView {
            VStack {
                Button("Filter by Category") {
                    // Navigate to CategoryFilterView
                }
                List(articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("News")
            .onAppear {
                fetchNews()
            }
        }
    }

    func fetchNews() {
        NewsAPI.shared.fetchNews(category: category) { articles in
            self.articles = articles
        }
    }
}
