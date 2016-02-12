import UIKit

public extension UIView {
    
    var scale: CGFloat {
        let screen = window?.screen ?? UIScreen.mainScreen()
        return screen.scale
    }
    
    var hairline: CGFloat {
        return 1 / scale
    }
    
}
