//
//  FeedUIState.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

// MARK: - FeedUIState

struct FeedUIState: Codable, Identifiable {
    let feedID: Int
    var isLiked: Bool = false
    var isSeen: Bool = false

    var id: Int { feedID }
}
