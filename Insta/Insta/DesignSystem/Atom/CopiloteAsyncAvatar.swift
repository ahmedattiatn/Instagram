//
//  CopiloteAsyncAvatar.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

struct CopiloteAsyncAvatar: View {
    let url: String
    let size: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}
