//
//  Photos.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//
import Foundation

// MARK: - Photos

public struct Photos: Codable {
    enum CodingKeys: String, CodingKey {
        case backCameraURL = "back_camera_url"
        case frontCameraURL = "front_camera_url"
    }

    let backCameraURL: String
    let frontCameraURL: String
}
