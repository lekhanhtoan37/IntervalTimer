//
//  RoundView.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

extension UIView {
  func makeCircular() {
    self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
    self.clipsToBounds = true
  }
}



