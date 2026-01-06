//
//  CopiloteAsyncPhoto.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

// MARK: - CopiloteAsyncPhoto

struct CopiloteAsyncPhoto: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image.resizable()
            } else {
                Color.gray.opacity(0.2)
            }
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .cornerRadius(8)
    }
}
