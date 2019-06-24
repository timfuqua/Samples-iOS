//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black

        view.addSubview(label)
        self.view = view
        
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        // Set a semi-transparent, black background.
        overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
        
        // Create the initial layer from the view bounds.
        let maskLayer = CAShapeLayer()
        maskLayer.frame = overlay.bounds
        maskLayer.fillColor = UIColor.black.cgColor
        
        // Create the frame for the circle.
        let radius: CGFloat = 50.0
        
        let rect = CGRect(x: overlay.frame.midX - radius, y: overlay.frame.midY - radius, width: 2 * radius, height: 2 * radius)
        
        // Create the path.
        let path = UIBezierPath(rect: overlay.bounds)
        maskLayer.fillRule = kCAFillRuleEvenOdd
        
        // Append the circle to the path so that it is subtracted.
        path.append(UIBezierPath(ovalIn: rect))
        maskLayer.path = path.cgPath
        
        // Set the mask of the view.
        overlay.layer.mask = maskLayer
        
        // Add the view so it is visible.
        self.view.addSubview(overlay)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
