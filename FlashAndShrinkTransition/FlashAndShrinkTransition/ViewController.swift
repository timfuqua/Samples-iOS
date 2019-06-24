//
//  ViewController.swift
//  FlashAndShrinkTransition
//
//  Created by Tim Fuqua on 2/16/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let zeroSize = CGSize(width: 0, height: 0)
    let zeroRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var upperLeftCorner: CGRect {
        return zeroRect
    }
    
    var upperRightCorner: CGRect {
        return CGRectOffset(zeroRect, paddingView.frame.width, 0)
    }

    var lowerLeftCorner: CGRect {
        return CGRectOffset(zeroRect, 0, paddingView.frame.height)
    }

    var lowerRightCorner: CGRect {
        return CGRectOffset(zeroRect, paddingView.frame.width, paddingView.frame.height)
    }
    
    var firstQuadButtonSnapshot: UIView!
    var secondQuadButtonSnapshot: UIView!
    var thirdQuadButtonSnapshot: UIView!
    var fourthQuadButtonSnapshot: UIView!

    @IBOutlet weak var paddingView: UIView!
    @IBOutlet weak var firstQuadButton: UIButton!
    @IBOutlet weak var secondQuadButton: UIButton!
    @IBOutlet weak var thirdQuadButton: UIButton!
    @IBOutlet weak var fourthQuadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        firstQuadButtonSnapshot = firstQuadButton.snapshotViewAfterScreenUpdates(false)
        secondQuadButtonSnapshot = secondQuadButton.snapshotViewAfterScreenUpdates(false)
        thirdQuadButtonSnapshot = thirdQuadButton.snapshotViewAfterScreenUpdates(false)
        fourthQuadButtonSnapshot = fourthQuadButton.snapshotViewAfterScreenUpdates(false)
    }

    @IBAction func firstQuadButtonPressed(sender: UIButton) {
        print("ViewController::firstQuadButtonPressed:")
        flashInCenterAndDismissView(sender
            , toFinalFrameCenterPosition: CGPointApplyAffineTransform(view.upperRightCorner, CGAffineTransformMakeTranslation(-sender.frame.width, sender.frame.height))
        )
    }
    
    @IBAction func secondQuadButtonPressed(sender: UIButton) {
        print("ViewController::secondQuadButtonPressed:")
        flashInCenterAndDismissView(sender
            , toFinalFrameCenterPosition: CGPointApplyAffineTransform(view.lowerRightCorner, CGAffineTransformMakeTranslation(-sender.frame.width, -sender.frame.height))
            , usingSnapshotView: secondQuadButtonSnapshot
        )
    }
    
    @IBAction func thirdQuadButtonPressed(sender: UIButton) {
        print("ViewController::thirdQuadButtonPressed:")
        flashInCenterAndDismissView(sender
            , toFinalFrameCenterPosition: CGPointApplyAffineTransform(view.lowerLeftCorner, CGAffineTransformMakeTranslation(sender.frame.width, -sender.frame.height))
            , usingSnapshotView: firstQuadButtonSnapshot
        )
    }
    
    @IBAction func fourthQuadButtonPressed(sender: UIButton) {
        print("ViewController::fourthQuadButtonPressed:")
        flashInCenterAndDismissView(sender
            , toFinalFrameCenterPosition: CGPointApplyAffineTransform(view.upperLeftCorner, CGAffineTransformMakeTranslation(sender.frame.width, sender.frame.height))
        )
    }
    
}

extension UIView {
    
    var upperLeftCorner: CGPoint { return CGPoint(x: 0, y: 0) }
    var upperLeftCornerInScreen: CGPoint { return self.convertPoint(self.upperLeftCorner, toView: nil) }
    var upperRightCorner: CGPoint { return CGPoint(x: self.frame.width, y: 0) }
    var upperRightCornerInScreen: CGPoint { return self.convertPoint(self.upperRightCorner, toView: nil) }
    var lowerLeftCorner: CGPoint { return CGPoint(x: 0, y: self.frame.height) }
    var lowerLeftCornerInScreen: CGPoint { return self.convertPoint(self.lowerLeftCorner, toView: nil) }
    var lowerRightCorner: CGPoint { return CGPoint(x: self.frame.width, y: self.frame.height) }
    var lowerRightCornerInScreen: CGPoint { return self.convertPoint(self.lowerRightCorner, toView: nil) }
    
}

extension UIViewController {
    
    func flashInCenterAndDismissView(sourceView: UIView, toFinalFrameCenterPosition finalFrameCenterPosition: CGPoint, usingSnapshotView snapshotView: UIView? = nil) {
        let snapshot = (snapshotView != nil) ? snapshotView!.snapshotViewAfterScreenUpdates(false) : sourceView.snapshotViewAfterScreenUpdates(false)
        snapshot.transform = CGAffineTransformMakeScale(4, 4)
        snapshot.center = self.view.center
        self.view.addSubview(snapshot)
        
        let finalView = UIView(frame: sourceView.frame)
        finalView.center = finalFrameCenterPosition
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeLinear,
            animations: {
                snapshot.frame = finalView.frame
            }, completion: { (value: Bool) in
                snapshot.removeFromSuperview()
        })
    }

}
