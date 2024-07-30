//
//  ArticleDetailView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.title)
                    .bold()
                if let content = article.content {
                    Text(content)
                        .font(.body)
                }
                Button("Bookmark") {
                    // Bookmark logic here
                }
            }
            .padding()
        }
        .navigationBarTitle("Article", displayMode: .inline)
    }
}
