//
//  TimeViewModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxCocoa
import RxSwift

class TimeViewModel {

  let warmUp = BehaviorRelay<Int>(value: 10)
  let lowInterval = BehaviorRelay<Int>(value: 75)
  let highInterval = BehaviorRelay<Int>(value: 60)
  let coolDown = BehaviorRelay<Int>(value: 30)
  let set = BehaviorRelay<Int>(value: 10)


}
