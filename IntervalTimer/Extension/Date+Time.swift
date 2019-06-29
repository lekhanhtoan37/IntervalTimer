//
//  Date+Time.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/15/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation


extension String {

  func getHour() -> Int {
    var hour = 0
    
    if self.countInstances(of: ":") == 1 {
      return hour
    } else {
      hour = Int(self.components(separatedBy: ":").first ?? "0") ?? 0
    }
    return hour
  }
  
  func getMinute() -> Int {
    var minutes = 0
    if self.countInstances(of: ":") == 1 {
      minutes = Int(self.components(separatedBy: ":").first ?? "0") ?? 0
    } else {
      minutes = Int(self.components(separatedBy: ":")[self.countInstances(of: ":") - 1]) ?? 0
    }
    return minutes
  }
  
  func getSecond() -> Int {
    let seconds = Int(self.components(separatedBy: ":")[self.countInstances(of: ":")]) ?? 0
    return seconds
  }
  
  func getTotalToSecond() -> Int {
    return self.getHour().hours + self.getMinute().minutes + self.getSecond().seconds
  }
  

}


