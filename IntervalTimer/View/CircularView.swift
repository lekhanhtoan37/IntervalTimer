//
//  File.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
@IBDesignable
class CircularView: UIView {
  private var _cornerRadius: CGFloat = 0.0
  
  @IBInspectable
  var cornerRadius: CGFloat {
    set (newValue) {
      _cornerRadius = newValue
      setCornerRadius()
    }
    get {
      return _cornerRadius
    }
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    setCornerRadius()
  }
  func setCornerRadius() {
    if _cornerRadius == -1 {
      layer.cornerRadius = min(frame.width, frame.height) * 0.5
    } else {
      layer.cornerRadius = min(frame.width, frame.height) * 0.5
    }
  }
}

@IBDesignable
class CircularButton: UIButton {
  private var _cornerRadius: CGFloat = 0.0
  
  @IBInspectable
  var cornerRadius: CGFloat {
    set (newValue) {
      _cornerRadius = newValue
      setCornerRadius()
    }
    get {
      return _cornerRadius
    }
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    setCornerRadius()
  }
  func setCornerRadius() {
    
    layer.cornerRadius = min(frame.width, frame.height) * 0.5
    
  }
}
