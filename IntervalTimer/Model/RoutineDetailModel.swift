//
//  RoutineDetailModel.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/19/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

// MARK: - 19/06/2019
import Foundation
import RxDataSources
import RxSwift

struct RoutineNameModel {
  let name: String
}

struct WarmUpTimeModel {
  let warmUpTime: String
}

struct CycleModel {
  let cycle: Int
}

struct RepeatModel {
  let repeatMode: Bool
}

//struct CoolDownTimeModel {
//  let coolDownTime: String
//}

enum AddEditSectionModel {
  case NameSection(items: [SectionItem])
  case WarmUpSection(items: [SectionItem])
  case CycleSection(items: [SectionItem])
  case RepeatMode(items: [SectionItem])
}

//enum SectionItem {
//  case nameCell()
//  case warmUpCell()
//  case cycleCell()
//  case repeatMode()
//  //  case coolDownTime
//}
enum SectionItem {
  case StatusOne
  case StatusTwo
  case StatusThree
}


extension AddEditSectionModel: SectionModelType {
  typealias Item = SectionItem
  
  var items: [Item] {
    switch self {
    case .NameSection(items: let items):
      return items.map { $0 }
    case .WarmUpSection(items: let items):
      return items.map { $0 }
    case .CycleSection(items: let items):
      return items.map { $0 }
    case .RepeatMode(items: let items):
      return items.map { $0 }
      
    }
  }
    
    init(original: AddEditSectionModel, items: [Item]) {
      switch  original {
      case .NameSection(items: _):
        self = .NameSection(items: items)
      case .WarmUpSection(items: _):
        self = .WarmUpSection(items: items)
      case .CycleSection(items: _):
        self = .CycleSection(items: items)
      case .RepeatMode(items: _):
        self = .RepeatMode(items: items)
      }
    }
}
