//
//  BookmarkView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct BookmarkView: View {
    @State private var bookmarkedArticles: [Article] = []

    var body: some View {
        List(bookmarkedArticles) { article in
            NavigationLink(destination: ArticleDetailView(article: article)) {
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.subheadline)
                }
            }
        }
        .navigationBarTitle("Bookmarks")
    }
}

