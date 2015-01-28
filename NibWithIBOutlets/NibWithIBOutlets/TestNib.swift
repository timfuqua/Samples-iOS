//
//  TestNib.swift
//  NibWithIBOutlets
//
//  Created by Tim Fuqua on 1/26/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

@IBDesignable
class TestNib: UIView {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    private var proxyView: TestNib?

    @IBInspectable var title: String = "" {
        didSet {
            self.proxyView!.titleLabel.text = title
        }
    }
    
    @IBInspectable var avatarImage: UIImage = UIImage() {
        didSet {
            let size = self.avatarImage.size
            let rect = CGRectMake(0, 0, size.width, size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            var path = UIBezierPath(ovalInRect: rect)
            path.addClip()
            self.avatarImage.drawInRect(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.proxyView!.avatarImageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let bundle = NSBundle(forClass: self.dynamicType)
        var view = bundle.loadNibNamed("TestNib", owner: nil, options: nil)[0] as TestNib
        view.frame = self.bounds
        view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.addSubview(view)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        if self.subviews.count == 0 {
            var view = self.loadNib()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            let contraints = self.constraints()
            self.removeConstraints(contraints)
            view.addConstraints(contraints)
            view.proxyView = view
            return view
        }
        return self
    }
    
    private func loadNib() -> TestNib {
        let bundle = NSBundle(forClass: self.dynamicType)
        var view = bundle.loadNibNamed("TestNib", owner: nil, options: nil)[0] as TestNib
        return view
    }

}
