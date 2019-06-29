//
//  File.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

struct RoutineModel {
  let title: String
  let time: String
  
  init(title: String, timeModel: TimeModel) {
    self.title = title
    self.time = String((timeModel.warmUp + timeModel.coolDown + (timeModel.highInterval * timeModel.set) + (timeModel.lowInterval * timeModel.set)))
  }

}
