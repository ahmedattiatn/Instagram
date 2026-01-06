//
//  Endpoint.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

// MARK: - FeedsRequest

import Foundation

public enum Endpoint {
    case feeds

    // MARK: Internal

    var path: String {
        switch self {
        case .feeds:
            "/bereal_feed.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .feeds:
            .GET
        }
    }
}
