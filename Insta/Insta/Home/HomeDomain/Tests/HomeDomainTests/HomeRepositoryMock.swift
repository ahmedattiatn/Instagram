//
//  RepositoryMock.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory
import XCTest

final class HomeRepositoryMock: HomeRepositoryProtocol {
    // MARK: Lifecycle

    // MARK: - Init

    init(
        feedResult: Result<FeedResponse?, Error>
    ) {
        self.feedResult = feedResult
    }

    // MARK: Internal

    // MARK: - Stored results for tests

    var feedResult: Result<FeedResponse?, Error>

    // MARK: - HomeRepositoryProtocol

    func loadFeedResponse() async throws -> FeedResponse? {
        switch feedResult {
        case let .success(response): return response
        case let .failure(error): throw error
        }
    }
}
