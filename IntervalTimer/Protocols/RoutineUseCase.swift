//
//  RoutineUseCase.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/26/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//
import RxSwift
import RxCocoa

protocol RoutineUseCase {
  func routines() -> Observable<[RoutineModel]>
  func save(routine: RoutineModel) -> Observable<Void>
  func delete(routine: RoutineModel) -> Observable<Void>
}
