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
  let items = BehaviorRelay<[RoutineModel]>(value: [])
  let title = BehaviorRelay<String>(value: "")
  let routineModel: RoutineModel
  let timeViewModel: TimeViewModel
  init(routineModel: RoutineModel, timeViewModel: TimeViewModel) {
    self.routineModel = routineModel
    self.timeViewModel = timeViewModel
    self.items.acceptAppending(RoutineModel(title: routineModel.title, timeModel: TimeModel(warmUp: timeViewModel.warmUp.value, lowInterval: timeViewModel.lowInterval.value, highInterval: timeViewModel.highInterval.value, coolDown: timeViewModel.coolDown.value, set: timeViewModel.set.value)))
  }
}

