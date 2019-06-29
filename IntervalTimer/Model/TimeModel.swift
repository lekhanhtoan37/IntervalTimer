//
//  TimeModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/15/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation

struct TimeModel {
  let warmUp: Int
  let lowInterval: Int
  let highInterval: Int
  let coolDown: Int
  let set: Int
  
  init(warmUp: Int, lowInterval: Int, highInterval: Int, coolDown: Int, set: Int) {
    self.warmUp = warmUp
    self.lowInterval = lowInterval
    self.highInterval = highInterval
    self.coolDown = coolDown
    self.set = set
  }
}
