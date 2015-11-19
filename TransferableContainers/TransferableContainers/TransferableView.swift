//
//  TransferableView.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/10/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

// MARK: TransferableView: UIView
/**

*/
class TransferableView: UIView {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  var newView: UIView? = nil
  
  // MARK: init
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: public funcs
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if let touch = touches.first {
      let touchPoint: CGPoint = touch.locationInView(self)
      
      if CGRectContainsPoint(self.bounds, touchPoint) {
        let newRect: CGRect = CGRectMake(touchPoint.x - 50, touchPoint.y - 50, 100, 100)
        
        self.newView = UIView(frame: newRect)
        self.newView!.backgroundColor = UIColor.cyanColor()
        self.addSubview(self.newView!)
      }
    }
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if self.newView != nil {
      if let touch = touches.first {
        let touchPoint: CGPoint = touch.locationInView(self)
        self.newView!.center = touchPoint
      }
    }
  }

  // MARK: private funcs
  
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//  UITouch *touch = [touches anyObject];
//  CGPoint touchPoint = [touch locationInView:self];
//  
//  if (CGRectContainsPoint(self.bounds, touchPoint)) {
//    
//    CGRect r = CGRectMake(touchPoint.x-50, touchPoint.y-50, 100, 100);
//    
//    self.newView = [[[UIView alloc] initWithFrame:r]autorelease];
//    self.newView.backgroundColor= [UIColor cyanColor];
//    [self addSubview:self.newView];
//    
//  }
//}
//
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//  if (self.newView!=nil) {
//    UITouch *touch = [touches anyObject];
//    CGPoint touchPoint = [touch locationInView:self];
//    self.newView.center = touchPoint;
//  }
//}






















