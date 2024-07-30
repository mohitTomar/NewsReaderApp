//
//  BookmarkView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct BookmarkView: View {
    // State variable to hold the list of bookmarked articles
    @State private var bookmarkedArticles: [Article] = []

    var body: some View {
        // List to display the bookmarked articles
        List(bookmarkedArticles) { article in
            // NavigationLink to navigate to ArticleDetailView when a bookmarked article is selected
            NavigationLink(destination: ArticleDetailView(article: article)) {
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.subheadline)
                }
            }
        }
        .navigationBarTitle("Bookmarks") // Set the title of the navigation bar
    }
}
