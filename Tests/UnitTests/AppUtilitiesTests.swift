import XCTest
@testable import iPhoneCore

final class AppUtilitiesTests: XCTestCase {
    
    var appUtilities: AppUtilities!
    
    override func setUp() {
        super.setUp()
        appUtilities = AppUtilities.shared
    }
    
    override func tearDown() {
        appUtilities = nil
        super.tearDown()
    }
    
    func testAppVersionNotEmpty() {
        XCTAssertFalse(appUtilities.appVersion.isEmpty)
        // Note: In test environment, this might return "Unknown" which is expected
    }
    
    func testBuildNumberNotEmpty() {
        XCTAssertFalse(appUtilities.buildNumber.isEmpty)
        // Note: In test environment, this might return "Unknown" which is expected
    }
    
    func testGenerateUUID() {
        let uuid1 = appUtilities.generateUUID()
        let uuid2 = appUtilities.generateUUID()
        
        XCTAssertNotEqual(uuid1, uuid2)
        XCTAssertEqual(uuid1.count, 36) // Standard UUID length
        XCTAssertEqual(uuid2.count, 36)
    }
    
    func testDeviceModel() {
        let deviceModel = appUtilities.deviceModel
        XCTAssertFalse(deviceModel.isEmpty)
    }
    
    func testSingletonInstance() {
        let instance1 = AppUtilities.shared
        let instance2 = AppUtilities.shared
        XCTAssertTrue(instance1 === instance2)
    }
}