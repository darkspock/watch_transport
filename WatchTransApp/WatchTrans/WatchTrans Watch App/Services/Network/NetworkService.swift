//
//  NetworkService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//  HTTP client for API requests
//

import Foundation

class NetworkService {
    private let session: URLSession

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10  // 10 seconds for watchOS
        configuration.timeoutIntervalForResource = 15
        configuration.waitsForConnectivity = true
        self.session = URLSession(configuration: configuration)
    }

    /// Fetch and decode JSON data from a URL
    func fetch<T: Decodable>(_ url: URL) async throws -> T {
        do {
            let (data, response) = try await session.data(from: url)

            // Validate HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }

            // Decode JSON
            // Note: We use explicit CodingKeys in models, so don't use .convertFromSnakeCase
            let decoder = JSONDecoder()

            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }

        } catch let error as NetworkError {
            throw error
        } catch let error as URLError {
            // Map URLError to NetworkError
            switch error.code {
            case .notConnectedToInternet, .networkConnectionLost:
                throw NetworkError.noConnection
            case .timedOut:
                throw NetworkError.timeout
            default:
                throw NetworkError.unknown(error)
            }
        } catch {
            throw NetworkError.unknown(error)
        }
    }

    /// Fetch raw data from a URL (for non-JSON responses)
    func fetchData(_ url: URL) async throws -> Data {
        do {
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }

            return data

        } catch let error as NetworkError {
            throw error
        } catch let error as URLError {
            switch error.code {
            case .notConnectedToInternet, .networkConnectionLost:
                throw NetworkError.noConnection
            case .timedOut:
                throw NetworkError.timeout
            default:
                throw NetworkError.unknown(error)
            }
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
