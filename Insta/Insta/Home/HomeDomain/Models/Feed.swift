//
//  Feed.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//
import Foundation

// MARK: - Feed

public struct Feed: Codable, Identifiable {
    // MARK: Public

    public let id: Int

    // MARK: Internal

    enum CodingKeys: String, CodingKey {
        case id
        case user
        case caption
        case photos
        case createdAt = "created_at"
        case postedLate = "posted_late"
        case reactions
    }

    let user: User
    let caption: String
    let photos: Photos
    let createdAt: String
    let postedLate: Bool
    var reactions: [Reaction]
}
