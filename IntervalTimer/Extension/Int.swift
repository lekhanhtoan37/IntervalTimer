//
//  Int.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/15/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation

extension Int {
  
  var seconds: Int {
    return self
  }
  
  var minutes: Int {
    return self.seconds * 60
  }
  
  var hours: Int {
    return self.minutes * 60
  }
  
  var days: Int {
    return self.hours * 24
  }
  
  var weeks: Int {
    return self.days * 7
  }
  
  var months: Int {
    return self.weeks * 4
  }
  
  var years: Int {
    return self.months * 12
  }
}
