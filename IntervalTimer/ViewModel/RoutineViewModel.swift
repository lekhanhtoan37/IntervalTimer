//
//  RoutineViewModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RoutineViewModel {
  let title = BehaviorSubject<String>(value: "")
  
  let time = PublishSubject<TimeViewModel>()
  
}

struct TimeViewModel {
  var totalTime: String
  
  init(hour: Int, minute: Int, second: Int) {
    self.totalTime = String(hour) + ":" + String(minute) + ":" + String(second)
  }
}
