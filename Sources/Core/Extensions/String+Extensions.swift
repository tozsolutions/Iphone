import Foundation

extension String {
    /// Returns a localized version of the string
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    /// Returns a localized version of the string with arguments
    func localized(with arguments: CVarArg...) -> String {
        String(format: self.localized, arguments: arguments)
    }
    
    /// Validates if the string is a valid email address
    var isValidEmail: Bool {
        #if os(Linux) || os(Windows)
        // Simple regex alternative for platforms without NSPredicate
        let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return self.range(of: emailPattern, options: .regularExpression) != nil
        #else
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
        #endif
    }
    
    /// Removes whitespace and newlines from both ends
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Returns true if string is empty or contains only whitespace
    var isBlank: Bool {
        self.trimmed.isEmpty
    }
}