//
//  String.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/27/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation
extension String {
  // Find repeated string, return Count
  
  func indicesOf(string: String) -> Int {
    var indices = [Int]()
    var searchStartIndex = self.startIndex
    
    while searchStartIndex < self.endIndex,
      let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
      !range.isEmpty
    {
      let index = distance(from: self.startIndex, to: range.lowerBound)
      indices.append(index)
      searchStartIndex = range.upperBound
    }
    
    return indices.count
  }
  
  /// stringToFind must be at least 1 character.
  func countInstances(of stringToFind: String) -> Int {
    assert(!stringToFind.isEmpty)
    var count = 0
    var searchRange: Range<String.Index>?
    while let foundRange = range(of: stringToFind, options: [], range: searchRange) {
      count += 1
      searchRange = Range(uncheckedBounds: (lower: foundRange.upperBound, upper: endIndex))
    }
    return count
  }
}
