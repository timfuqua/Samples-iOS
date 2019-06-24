//
//  UIView.swift
//  HolesInUIView
//
//  Created by Tim Fuqua on 9/10/18.
//  Copyright © 2018 Norswedgian Studios. All rights reserved.
//

import UIKit


extension UIView {
    func addCenterCircleOverlay(withOverlayBackgroundColor overlayBackgroundColor: UIColor) {
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        // Set a semi-transparent, black background.
        overlay.backgroundColor = overlayBackgroundColor
        
        // Create the initial layer from the view bounds.
        let maskLayer = CAShapeLayer()
        maskLayer.frame = overlay.bounds
//        maskLayer.fillColor = UIColor.black.cgColor
        
        // Create the frame for the circle.
        let radius: CGFloat = 50.0
        
        let rect = CGRect(x: overlay.frame.midX - radius, y: overlay.frame.midY - radius - 125, width: 2 * radius, height: 2 * radius)
        
        // Create the path.
        let path = UIBezierPath(rect: overlay.bounds)
        maskLayer.fillRule = kCAFillRuleEvenOdd
        
        // Append the circle to the path so that it is subtracted.
        path.append(UIBezierPath(ovalIn: rect))
        maskLayer.path = path.cgPath
        
        // Set the mask of the view.
        overlay.layer.mask = maskLayer

        self.addSubview(overlay)
    }
}
