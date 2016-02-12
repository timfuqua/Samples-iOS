import UIKit

/// Extension-safe user layout direction
extension UIUserInterfaceLayoutDirection: Printable {
    
    public static let userLayoutDirection: UIUserInterfaceLayoutDirection = {
        let direction = NSParagraphStyle.defaultWritingDirectionForLanguage(nil)
        switch NSParagraphStyle.defaultWritingDirectionForLanguage(nil) {
        case .LeftToRight:
            return .LeftToRight
        case .RightToLeft:
            return .RightToLeft
        case .Natural:
            if let localization = NSBundle.mainBundle().preferredLocalizations.first as? String {
                return NSLocale.characterDirectionForLanguage(localization) == .RightToLeft ? .RightToLeft : .LeftToRight
            }
            return .LeftToRight
        }
    }()
    
    public var description: String {
        switch self {
        case .LeftToRight: return "Left-to-Right"
        case .RightToLeft: return "Right-to-Left"
        }
    }
    
}
