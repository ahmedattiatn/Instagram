//
//  NetworkAPI.swift
//
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

final class NetworkAPI {
    func send<T: APIRequest>(_ request: T) async throws -> T.Response {
        guard let url = request.url else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.endpoint.method.rawValue

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: urlRequest)
        } catch {
            throw NetworkError.unknown(error)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown(NSError(domain: "Invalid response", code: 0))
        }

        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.Response.self, from: data)
        } catch {
            print(error)
            throw NetworkError.decodingError
        }
    }
}
