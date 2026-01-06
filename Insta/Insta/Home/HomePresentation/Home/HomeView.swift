//
//  HomeView.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

// MARK: - HomeView

struct HomeView: View {
    // MARK: Internal

    var body: some View {
        NavigationStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Instagram")
                .task(id: viewModel.feeds.isEmpty) {
                    if viewModel.feeds.isEmpty {
                        await viewModel.loadFeeds()
                    }
                }
        }
    }

    // MARK: Private

    @StateObject private var viewModel = HomeViewModel()

    @ViewBuilder
    private var content: some View {
        switch viewModel.homeViewState {
        case .loading:
            ProgressView("Loading Feeds...")
        case .empty:
            emptyView()
        case .loadedContent:
            feedsAndStoriesView()
        case let .error(message):
            errorView(message)
        }
    }

    @ViewBuilder
    private func errorView(_ message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            CopiloteTextView(text: message, style: .title)
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    @ViewBuilder
    private func feedsAndStoriesView() -> some View {
        VStack(spacing: CopiloteSpacing.medium()) {
            storiesView()
            feedsView()
        }
    }

    // MARK: - Infinite scrolling stories

    @ViewBuilder
    private func storiesView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(0 ..< 100, id: \.self) { index in
                    if !viewModel.feeds.isEmpty {
                        let feed = viewModel.feeds[index % viewModel.feeds.count]
                        NavigationLink {
                            HomeRouter.destinationForTappedStory(
                                viewModel: viewModel,
                                initialFeedID: feed.id
                            )
                        } label: {
                            StoryItemView(
                                feed: feed,
                                viewModel: viewModel
                            )
                        }
                    }
                }
            }
            .frame(height: 100)
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func feedsView() -> some View {
        ScrollView {
            LazyVStack(spacing: CopiloteSpacing.medium()) {
                ForEach(viewModel.feeds) { feed in
                    FeedCarView(feed: feed).padding(.horizontal)
                }
            }
            .padding(.top)
            .refreshable { await viewModel.loadFeeds() }
        }
    }

    @ViewBuilder
    private func emptyView() -> some View {
        VStack(spacing: 16) {
            Image(systemName: "tray")
                .font(.largeTitle)
                .foregroundColor(.gray)
            CopiloteTextView(text: "No feeds available.", style: .title)
                .foregroundColor(.gray)
        }
    }
}
