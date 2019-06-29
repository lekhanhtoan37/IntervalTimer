//
//  Image.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/27/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
extension CIImage {
  func convertCIImageToCGImage() -> CGImage! {
    let context = CIContext(options: nil)
    if context != nil {
      return context.createCGImage(self, from: self.extent)
    }
    return nil
  }
}
