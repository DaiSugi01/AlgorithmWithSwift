//
//  763_PartitionLabels.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/11.
//

import Foundation

// LeetCode; https://leetcode.com/problems/partition-labels/
func partitionLabels(_ S: String) -> [Int] {
  
  var res = [Int]()
  var chars = [String: Int]()
  for i in 0 ..< S.count {
    chars[S[i], default: 0] = i
  }
  
  var start = 0, last = 0
  var prev = 0

  while start < S.count {
    last = chars[S[start]]!
    while start <= last {
      let target = S[start]
      last = max(last, chars[target]!)
      start += 1
    }
    res.append(start - prev)
    prev = start
  }

  return res
}
