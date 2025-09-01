import Foundation
#if canImport(Combine)
import Combine

protocol NetworkService {
    func fetch<T: Codable>(_ type: T.Type, from url: URL) -> AnyPublisher<T, NetworkError>
}

class NetworkManager: NetworkService {
    static let shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: configuration)
    }
    
    func fetch<T: Codable>(_ type: T.Type, from url: URL) -> AnyPublisher<T, NetworkError> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decodingFailed
                } else {
                    return NetworkError.networkFailure(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
#endif

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case networkFailure(Error)
    case decodingFailed
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkFailure(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingFailed:
            return "Failed to decode response"
        case .noData:
            return "No data received"
        }
    }
}