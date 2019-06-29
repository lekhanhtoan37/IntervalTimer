//
//  File.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/19/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxSwift
import RxCocoa


class MainViewModel: ViewModelType {
  private let navigator: UINavigationController
  
  init(navigator: UINavigationController) {
    self.navigator = navigator
  }
  
  struct Input {
    let trigger: Driver<Void>
    let editTrigger: Driver<Void>
    let selection: Driver<IndexPath>
    let createTrigger: Driver<Void>
  }
  struct Output {
    let createRoutine: Driver<Void>
    let editRoutine: Driver<Void>
    let selectedRoutine: Driver<RoutineViewModel>
    let routines: Driver<[RoutineViewModel]>

  }
  
  func transform(input: Input) -> Output {

    let createRoutine = input.createTrigger.do(onNext: {
      let addEditVC = AddEditViewController()
      let navAddEditViewController: UINavigationController = UINavigationController(rootViewController: addEditVC)

      self.navigator.present(navAddEditViewController, animated: true, completion: nil)
      
    })
    
    let editRoutine = input.editTrigger
      .do(onNext: {
      
      let progressVC = ProgressViewController()
      let progressViewController = UINavigationController(rootViewController: progressVC)
      
      self.navigator.present(progressViewController, animated: true, completion: nil)
    })
    
    let routines = input.trigger.flatMapLatest {
      
    }
 
  
    return Output(createRoutine: createRoutine, editRoutine: editRoutine, selectedRoutine: <#T##Driver<RoutineViewModel>#>, routines: <#T##Driver<[RoutineViewModel]>#>)
  }
}
