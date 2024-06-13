//
//  ListRowView.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import SwiftUI

struct ListRowView: View {
    
    @ObservedObject var viewModel: ListViewModel
    var listItem: Item
    
    var body: some View {
        HStack {
            if let imageUrl = listItem.imageUrl, let url = URL(string: "https://www.nytimes.com/\(imageUrl)") {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listItem.title ?? "")
                    .font(.headline)
                Text(listItem.descriptionBody ?? "")
                    .font(.subheadline)
                    .lineLimit(2)
                Text(viewModel.formatDate(listItem.pubDate))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
