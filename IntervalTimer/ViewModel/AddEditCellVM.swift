//
//  AddEditCellVM.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/18/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxSwift
import RxCocoa

class AddEditCellVM {

  let name: String
  
  init(routineModel: RoutineModel) {
    self.name = routineModel.title
  }
}
