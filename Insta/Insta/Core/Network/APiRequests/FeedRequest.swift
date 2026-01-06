//
//  FeedRequest.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

// MARK: - FeedsRequest

struct FeedRequest: APIRequest {
    typealias Response = FeedResponse

    let endpoint: Endpoint = .feeds
}
