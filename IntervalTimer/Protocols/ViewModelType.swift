//
//  ViewModelType.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/21/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation

protocol ViewModelType {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}
