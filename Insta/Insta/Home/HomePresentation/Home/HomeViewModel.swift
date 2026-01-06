//
//  HomeViewModel.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Combine
import Factory
import Foundation

// MARK: - HomeViewModel

@MainActor
final class HomeViewModel: ObservableObject {
    // MARK: Lifecycle

    init() {
        Task { await loadFeeds() }
    }

    // MARK: Internal

    @Published var feeds: [Feed] = []
    @Published var homeViewState: HomeViewState = .empty
    @Published var feedStates: [FeedUIState] = []

    func loadFeeds() async {
        homeViewState = .loading
        do {
            let networkFeeds = try await getFeedsUseCase() ?? []
            let savedStates = loadSavedStates()
            feeds = networkFeeds
            feedStates = networkFeeds.map { feed in
                savedStates.first(
                    where: { $0.feedID == feed.id }
                ) ?? FeedUIState(feedID: feed.id)
            }
            homeViewState = feeds.isEmpty ? .empty : .loadedContent
        } catch {
            homeViewState = .error("Failed to load Feeds")
        }
    }

    // MARK: - Toggle like

    func toggleLike(for feedID: Int) {
        guard let index = feedStates.firstIndex(where: { $0.feedID == feedID }) else {
            return
        }
        feedStates[index].isLiked.toggle()
        saveStates()
    }

    // MARK: - Mark as seen

    func markAsSeen(for feedID: Int) {
        guard let index = feedStates.firstIndex(where: { $0.feedID == feedID }) else {
            return
        }
        feedStates[index].isSeen = true
        saveStates()
    }

    // MARK: - Get state by feedID

    func getStateBy(_ feedID: Int) -> FeedUIState? {
        feedStates.first(where: { $0.feedID == feedID })
    }

    // MARK: Private

    private let feedsKey = "feeds_storage"
    @LazyInjected(\.getFeedsUseCase) private var getFeedsUseCase

    // MARK: - Persistence

    private func saveStates() {
        if let data = try? JSONEncoder().encode(feedStates) {
            UserDefaults.standard.set(data, forKey: feedsKey)
        }
    }

    private func loadSavedStates() -> [FeedUIState] {
        guard let data = UserDefaults.standard.data(forKey: feedsKey),
              let saved = try? JSONDecoder().decode([FeedUIState].self, from: data) else {
            return []
        }
        return saved
    }
}
