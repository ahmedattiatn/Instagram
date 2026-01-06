//
//  FeedCarView.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//
import SwiftUI

struct FeedCarView: View {
    let feed: Feed

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                CopiloteAsyncAvatar(url: feed.user.avatarURL, size: 40)
                VStack(alignment: .leading, spacing: 2) {
                    CopiloteTextView(
                        text: feed.user.name,
                        style: .subheadline
                    )
                    .bold()
                    CopiloteTextView(
                        text: feed.createdAt,
                        style: .caption
                    )
                    .foregroundColor(.gray)
                }
                Spacer()
                if feed.postedLate {
                    CopiloteTextView(
                        text: "Late",
                        style: .caption
                    )
                    .padding(4)
                    .background(Color.red.opacity(0.2)).foregroundColor(.red)
                    .padding(.trailing, 4)
                    .cornerRadius(4)
                }
            }
            CopiloteTextView(
                text: feed.caption,
                style: .body
            )
            CopiloteAsyncPhoto(url: feed.photos.backCameraURL)
                .frame(height: 320)
                .overlay(alignment: .topLeading) {
                    CopiloteAsyncPhoto(url: feed.photos.frontCameraURL)
                        .frame(width: 60, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 2)
                        }
                        .padding(CopiloteSpacing.tiny())
                }
        }
        .padding(.top, CopiloteSpacing.tiny())
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
