//
//  CategoryFilterView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct CategoryFilterView: View {
    let categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    @Binding var selectedCategory: String

    var body: some View {
        List(categories, id: \.self) { category in
            Button(action: {
                selectedCategory = category
                // Navigate back to ContentView
            }) {
                Text(category.capitalized)
            }
        }
        .navigationBarTitle("Select Category")
    }
}
