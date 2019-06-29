//
//  Themes.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/28/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

enum ThemeType: CaseIterable {

  static let allValues = [warmUp, highInterval, lowInterval, coolDown, warmUpBelow, highIntervalBelow, lowIntervalBelow, coolDownBelow]
  
  case warmUp
  case highInterval
  case lowInterval
  case coolDown
  
  case warmUpBelow
  case highIntervalBelow
  case lowIntervalBelow
  case coolDownBelow
  

  var themes: UIColor {
    switch self {
    case .warmUp:
      return UIColor(red: 214/255, green: 186/255, blue: 61/255, alpha: 1)
    case .lowInterval:
      return UIColor(red: 111/255, green: 183/255, blue: 57/255, alpha: 1)
    case .highInterval:
      return UIColor(red: 214/255, green: 81/255, blue: 100/255, alpha: 1)
    case .coolDown:
      return UIColor(red: 80/255, green: 124/255, blue: 231/255, alpha: 1)
    case .warmUpBelow:
      return #colorLiteral(red: 0.7721318603, green: 0.6517248154, blue: 0, alpha: 1)
    case .highIntervalBelow:
      return #colorLiteral(red: 0.8164154887, green: 0.2390032113, blue: 0.3326733112, alpha: 1)
    case .lowIntervalBelow:
      return #colorLiteral(red: 0.2918857634, green: 0.653196156, blue: 0.06607105583, alpha: 1)
    case .coolDownBelow:
      return #colorLiteral(red: 0.2301791906, green: 0.4444610476, blue: 0.843170464, alpha: 1)
    }
  }
}

extension UIColor {
  static func colorFormHex(hex: UInt32) -> UIColor{
    let div = CGFloat (255)
    let red = CGFloat ((hex & 0xFF0000) >> 16) / div
    let green = CGFloat((hex & 0x00FF00) >> 8) / div
    let blue  = CGFloat(hex & 0x0000FF)  / div
    return UIColor(red: red, green: green, blue: blue, alpha:  1)
  }
}
