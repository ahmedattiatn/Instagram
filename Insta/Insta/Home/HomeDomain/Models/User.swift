//
//  User.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//
import Foundation

// MARK: - User

public struct User: Codable, Identifiable {
    // MARK: Public

    public let id: Int

    // MARK: Internal

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarURL = "avatar_url"
    }

    let name: String
    let avatarURL: String
}
