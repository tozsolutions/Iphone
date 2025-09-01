import Foundation
#if canImport(UIKit)
import UIKit
#endif

class AppUtilities {
    static let shared = AppUtilities()
    
    private init() {}
    
    /// Gets the current app version
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
    
    /// Gets the current build number
    var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    }
    
    /// Checks if running on a physical device
    var isRunningOnDevice: Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        return true
        #endif
    }
    
    /// Gets device model information
    var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)) ?? UnicodeScalar(32)!)
        }
        return identifier
    }
    
    /// Generates a UUID string
    func generateUUID() -> String {
        UUID().uuidString
    }
    
    /// Safely opens a URL
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        #if canImport(UIKit)
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        #endif
    }
}