//
//  1641_CountSortedVowelStrings.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/17.
//

import Foundation

// LeetCode: https://leetcode.com/problems/count-sorted-vowel-strings/
func countVowelStrings(_ n: Int) -> Int {
  var dp = [Int](repeating: 1, count: 5)
  for _ in 0 ..< n {
    for j in 1 ..< 5 {
      dp[j] += dp[j - 1]
    }
  }
  
  return dp[dp.count - 1]
}
