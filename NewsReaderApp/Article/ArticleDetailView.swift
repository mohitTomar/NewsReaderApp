//
//  ArticleDetailView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    // Property to hold the article to be displayed
    let article: Article

    var body: some View {
        // ScrollView to allow vertical scrolling of content
        ScrollView {
            // VStack to arrange the article details vertically with spacing
            VStack(alignment: .leading, spacing: 10) {
                // Display the article title with a large bold font
                Text(article.title)
                    .font(.title)
                    .bold()
                // Display the article content if it exists
                if let content = article.content {
                    Text(content)
                        .font(.body)
                }
                // Button to bookmark the article (functionality to be added)
                Button("Bookmark") {
                    // Bookmark action goes here
                }
            }
            .padding() // Add padding around the VStack content
        }
        .navigationBarTitle("Article", displayMode: .inline) // Set the navigation bar title
    }
}
