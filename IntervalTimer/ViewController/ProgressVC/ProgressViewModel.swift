//
//  ProgressViewModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/25/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxSwift
import RxCocoa

class ProgressViewModel: ViewModelType {
  
  let timer = Timer()
  let elapsedTimer = Timer()
  let remainingTimer = Timer()

  struct Input {
    let startAction: Driver<Void>
    let time: Driver<String>
    let elapsedTime: Driver<String>
    let remainingTime: Driver<String>
  }

  struct Output{
    let timeCountDown: Driver<String>
    let timeStart: Driver<String>
    let timeRemaining: Driver<String>
    

  }

  func transform(input: Input) -> Output {
    
    let action = input.startAction.scan(false) {  lastState, newValue in
      return !lastState
    }

    return Output(timeCountDown: input.time, timeStart: input.elapsedTime, timeRemaining: input.remainingTime)
  }
  

}
