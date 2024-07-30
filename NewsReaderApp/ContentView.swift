//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import SwiftUI

struct ContentView: View {
    // State variables to hold the articles, selected category, and sheet visibility status
    @State private var articles: [Article] = []
    @State private var category: String = "general"
    @State private var showCategoryFilter = false

    var body: some View {
        // NavigationView to provide a navigation stack
        NavigationView {
            VStack {
                // Button to show the category filter sheet
                Button("Filter by Category") {
                    showCategoryFilter.toggle()
                }
                // Present a sheet for category filtering when the button is pressed
                .sheet(isPresented: $showCategoryFilter) {
                    // Pass the selected category and sheet visibility status to CategoryFilterView
                    CategoryFilterView(selectedCategory: $category, isPresented: $showCategoryFilter)
                }
                // List to display the fetched articles
                List(articles) { article in
                    // NavigationLink to navigate to ArticleDetailView when an article is selected
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
            .navigationBarTitle("News") // Set the title of the navigation bar
            .onAppear {
                fetchNews() // Fetch news articles when the view appears
            }
            .onChange(of: category) { _ in
                fetchNews() // Fetch news articles when the category changes
            }
        }
    }

    // Function to fetch news articles based on the selected category
    func fetchNews() {
        NewsAPI.shared.fetchNews(category: category) { articles in
            self.articles = articles
        }
    }
}
