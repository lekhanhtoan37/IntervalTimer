//
//  BehaviorRelay.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/20/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import RxCocoa
import RxSwift


extension BehaviorRelay where Element: RangeReplaceableCollection {
  func acceptAppending(_ element: Element.Element) {
    accept(value + [element])
  }
}
