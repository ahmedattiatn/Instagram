//
//  NetworkAPIError.swift
//
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

// MARK: - NetworkAPIError

public enum NetworkError: Error {
    case invalidURL
    case decodingError
    case serverError(statusCode: Int)
    case unknown(Error)
}
