import XCTest
#if canImport(Combine)
import Combine
#endif
@testable import iPhoneCore

final class NetworkManagerTests: XCTestCase {
    
    #if canImport(Combine)
    var networkManager: NetworkManager?
    var cancellables: Set<AnyCancellable>!
    #endif
    
    override func setUp() {
        super.setUp()
        #if canImport(Combine)
        networkManager = NetworkManager.shared
        cancellables = Set<AnyCancellable>()
        #endif
    }
    
    override func tearDown() {
        #if canImport(Combine)
        networkManager = nil
        cancellables = nil
        #endif
        super.tearDown()
    }
    
    #if canImport(Combine)
    func testSingletonInstance() {
        let instance1 = NetworkManager.shared
        let instance2 = NetworkManager.shared
        XCTAssertTrue(instance1 === instance2)
    }
    #endif
    
    func testNetworkErrorDescriptions() {
        XCTAssertEqual(NetworkError.invalidURL.errorDescription, "Invalid URL")
        XCTAssertEqual(NetworkError.decodingFailed.errorDescription, "Failed to decode response")
        XCTAssertEqual(NetworkError.noData.errorDescription, "No data received")
        
        let testError = NSError(domain: "TestDomain", code: 123, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        let networkError = NetworkError.networkFailure(testError)
        XCTAssertEqual(networkError.errorDescription, "Network error: Test error")
    }
    
    // Note: For actual network testing, you would need to use URLProtocol mocking
    // or dependency injection with a protocol-based approach
    func testNetworkManagerExists() {
        #if canImport(Combine)
        XCTAssertNotNil(networkManager)
        #else
        XCTAssertTrue(true, "NetworkManager requires Combine framework")
        #endif
    }
}

// Mock data structure for testing
struct MockData: Codable {
    let id: Int
    let name: String
}