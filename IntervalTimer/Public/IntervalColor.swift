//
//  File.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/17/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
enum IntervalColor {
//  typealias RawValue = UIColor
  
  case yellow
  case green
  case red
  case blue
  case orange
  case purple
  
  static let allValues = [yellow, green, red, blue, orange, purple]
  
  var color : UIColor {
    switch self {
    case .yellow:
      return #colorLiteral(red: 0.8508110642, green: 0.7260637879, blue: 0.01633936167, alpha: 1)
    case .green:
      return #colorLiteral(red: 0.2627517879, green: 0.6159676909, blue: 0.0621361956, alpha: 1)
    case .red:
      return #colorLiteral(red: 0.8993608952, green: 0.2713797092, blue: 0.3765969872, alpha: 1)
    case .blue:
      return #colorLiteral(red: 0.2567759454, green: 0.4929942489, blue: 0.9406448007, alpha: 1)
    case .orange:
      return #colorLiteral(red: 0.989420712, green: 0.4048523903, blue: 0.1738509834, alpha: 1)
    case .purple:
      return #colorLiteral(red: 0.6021408439, green: 0.3353248537, blue: 0.979809463, alpha: 1)
    }
  }
  
}

class ListColor {
  static let listColor = [#colorLiteral(red: 0.8508110642, green: 0.7260637879, blue: 0.01633936167, alpha: 1),#colorLiteral(red: 0.2627517879, green: 0.6159676909, blue: 0.0621361956, alpha: 1),#colorLiteral(red: 0.8993608952, green: 0.2713797092, blue: 0.3765969872, alpha: 1),#colorLiteral(red: 0.2567759454, green: 0.4929942489, blue: 0.9406448007, alpha: 1),#colorLiteral(red: 0.989420712, green: 0.4048523903, blue: 0.1738509834, alpha: 1),#colorLiteral(red: 0.6021408439, green: 0.3353248537, blue: 0.979809463, alpha: 1)]
  
  
}
