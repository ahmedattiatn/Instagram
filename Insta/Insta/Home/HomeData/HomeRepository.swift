//
//  HomeRepository.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

final class HomeRepository: HomeRepositoryProtocol {
    // MARK: Internal

    func loadFeedResponse() async throws -> FeedResponse? {
        // Return either the FeedResponse or an error (possibly mapped using a Home-specific error enum).
        try await client.send(FeedRequest())
    }

    // MARK: Private

    private let client = NetworkAPI()
}
