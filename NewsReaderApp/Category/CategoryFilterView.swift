//
//  CategoryFilterView.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import Foundation
import SwiftUI

struct CategoryFilterView: View {
    // Binding to the selected category, allowing changes to be reflected in the parent view
    @Binding var selectedCategory: String
    // Binding to the isPresented state, allowing the sheet to be dismissed
    @Binding var isPresented: Bool
    // Array of available categories for filtering news articles
    let categories = ["general", "business", "entertainment", "health", "science", "sports", "technology"]

    var body: some View {
        // NavigationView to provide a navigation stack for the list
        NavigationView {
            // List to display the available categories
            List(categories, id: \.self) { category in
                // Button for each category to select it and dismiss the sheet
                Button(action: {
                    selectedCategory = category // Update the selected category
                    isPresented = false // Dismiss the sheet
                }) {
                    // Display the category name with the first letter capitalized
                    Text(category.capitalized)
                }
            }
            .navigationBarTitle("Select Category") // Set the title of the navigation bar
        }
    }
}
