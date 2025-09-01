import Foundation

struct AppConstants {
    
    // MARK: - API Configuration
    struct API {
        static let baseURL = "https://api.example.com"
        static let timeout: TimeInterval = 30
        static let retryCount = 3
    }
    
    // MARK: - User Defaults Keys
    struct UserDefaultsKeys {
        static let isFirstLaunch = "isFirstLaunch"
        static let userPreferences = "userPreferences"
        static let lastSyncDate = "lastSyncDate"
    }
    
    // MARK: - App Configuration
    struct App {
        static let supportEmail = "support@tozsolutions.com"
        static let privacyPolicyURL = "https://tozsolutions.com/privacy"
        static let termsOfServiceURL = "https://tozsolutions.com/terms"
    }
    
    // MARK: - Animation Durations
    struct Animation {
        static let defaultDuration: Double = 0.3
        static let longDuration: Double = 0.6
        static let shortDuration: Double = 0.15
    }
    
    // MARK: - Layout Constants
    struct Layout {
        static let cornerRadius: CGFloat = 12
        static let smallCornerRadius: CGFloat = 8
        static let defaultPadding: CGFloat = 16
        static let smallPadding: CGFloat = 8
    }
}