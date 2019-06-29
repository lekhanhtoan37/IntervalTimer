//
//  AddEditViewModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/18/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxSwift
import RxCocoa

class AddEditViewModel: ViewModelType {
  
  private let navigator: UINavigationController
  
  init(navigator: UINavigationController) {
    self.navigator = navigator
  }
  
  struct Input {
    let cancelTrigger: Driver<Void>
    let saveTrigger: Driver<Void>
    let title: Driver<String>
    let warmUpTrigger: Driver<String>
    let setTrigger: Driver<Int>
    let cooldownTrigger: Driver<String>
    
  }
  struct Output {
    let dismiss: Driver<Void>
    let enableSave: Driver<Bool>
  }
  
  func transform(input: Input) -> Output {
    let canSave = input.title
      .asObservable()
      .skipWhile { title -> Bool in
        title.isEmpty
      }.do(onNext: { _ in
        self.navigator.dismiss(animated: true, completion: nil)
      }).asDriverOnErrorJustComplete()
    
    var isEnabled: Driver<Bool>{
      return input.title
        .asObservable()
        .map({ !$0.isEmpty })
        .asDriverOnErrorJustComplete()
    }
    
    let dismiss = input.cancelTrigger.do(onNext: { [weak self] _ in
        self?.navigator.dismiss(animated: true, completion: nil)
      
    }).asDriver()
    
    return Output(dismiss: dismiss, enableSave: isEnabled)
  
  }

}




