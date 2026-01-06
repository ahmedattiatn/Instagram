//
//  GetFeedsUseCase.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory

public struct GetFeedsUseCase: GetFeedsUseCaseProtocol {
    // MARK: Lifecycle

    public init() {}

    // MARK: Internal

    func callAsFunction() async throws -> [Feed]? {
        guard let homeRepository else {
            return nil
        }
        // We need to map the FeedResponse from the data layer to our Feed model,
        // apply any business rules if needed, then return either the list or an error.
        // Alternatively, if no business rules are required, we could do the mapping
        // directly in the data layer. In that case, the use case simply passes data through,
        // which is fine — in clean architecture, the data layer can work with domain models.
        do {
            return try await homeRepository.loadFeedResponse()?.feeds
        } catch {
            print("Failed to load Feeds: \(error)")
            throw error
        }
    }

    // MARK: Private

    @Injected(\.homeRepository) private var homeRepository
}
