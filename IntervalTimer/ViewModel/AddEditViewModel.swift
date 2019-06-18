//
//  AddEditViewModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/18/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxSwift
import RxCocoa

class AddEditViewModel {
  var numberOfSections: Int = 0
  var rowPerSection: [Int] = []
  
  let name = BehaviorRelay<String>(value: "")
  let time = BehaviorRelay<String>(value: "")
  
//  init(routineModel: RoutineModel) {
//    name.onNext(routineModel.title)
//  }
}
