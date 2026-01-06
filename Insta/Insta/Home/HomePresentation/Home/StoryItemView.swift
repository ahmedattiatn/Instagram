//
//  StoryItemView.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

// MARK: - StoryItemView

import SwiftUI

struct StoryItemView: View {
    let feed: Feed
    @ObservedObject var viewModel: HomeViewModel

    private var state: FeedUIState? {
        viewModel.getStateBy(feed.id)
    }

    var body: some View {
        CopiloteAsyncAvatar(url: feed.user.avatarURL, size: 70)
            .padding(4)
            .overlay {
                Circle()
                    .strokeBorder(
                        state?.isSeen == true ? Color.gray : Color.blue,
                        lineWidth: state?.isSeen == true ? 2 : 4
                    )
                    .opacity(state?.isSeen == true ? 0.6 : 1)
            }
    }
}
