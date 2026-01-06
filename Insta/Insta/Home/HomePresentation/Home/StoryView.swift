//
//  StoryView.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//
import SwiftUI

struct StoryView: View {
    @ObservedObject var viewModel: HomeViewModel
    let initialFeedID: Int

    @State private var selectedIndex: Int = 0
    @State private var progress: Double = 0
    private let storyDuration: TimeInterval = 2.0
    @State private var timer: Timer?

    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selectedIndex) {
                ForEach(Array(viewModel.feeds.enumerated()), id: \.offset) { index, feed in
                    ZStack {
                        CopiloteAsyncPhoto(url: feed.photos.frontCameraURL)
                        VStack {
                            HStack {
                                CopiloteAsyncAvatar(url: feed.user.avatarURL, size: 70)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(feed.user.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .shadow(radius: 2)
                                    Text(feed.createdAt)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                Spacer()
                                Button {
                                    viewModel.toggleLike(for: feed.id)
                                } label: {
                                    Image(
                                        systemName: viewModel.getStateBy(feed.id)?.isLiked == true
                                            ? "heart.fill"
                                            : "heart"
                                    )
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                }
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .tag(index)
                    .onAppear {
                        viewModel.markAsSeen(for: feed.id)
                        startProgress()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear {
                if let startIndex = viewModel.feeds.firstIndex(
                    where: { $0.id == initialFeedID }
                ) {
                    selectedIndex = startIndex
                }
            }
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                .padding(.horizontal)
                .padding(.top, 8)
        }
        .onDisappear { timer?.invalidate() }
    }

    private func startProgress() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            Task { @MainActor in
                progress += 0.02 / storyDuration
                if progress >= 1 {
                    progress = 0
                    selectedIndex = (selectedIndex + 1) % viewModel.feeds.count
                }
            }
        }
    }
}
