//
//  HomeRepositoryProtocol.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory

// MARK: - HomeRepositoryProtocol

public protocol HomeRepositoryProtocol {
    func loadFeedResponse() async throws -> FeedResponse?
}

public extension Container {
    var homeRepository: Factory<HomeRepositoryProtocol?> {
        promised()
    }
}
