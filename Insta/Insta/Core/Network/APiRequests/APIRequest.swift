//
//  APIRequest.swift
//
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

// MARK: - APIRequest

protocol APIRequest {
    associatedtype Response: Codable
    var endpoint: Endpoint { get }
}

extension APIRequest {
    var url: URL? {
        guard let baseUrl = URL(string: AppInfo.shared.apiBaseUrl) else {
            print("Invalid API Base URL in Info.plist")
            return nil
        }
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)
        components?.scheme = baseUrl.scheme
        components?.path = baseUrl.path + endpoint.path
        return components?.url
    }
}
