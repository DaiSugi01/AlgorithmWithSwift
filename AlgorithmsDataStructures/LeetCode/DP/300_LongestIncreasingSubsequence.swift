//
//  300_LongestIncreasingSubsequence.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/20.
//

import Foundation

// LeetCode: https://leetcode.com/problems/longest-increasing-subsequence/
func lengthOfLIS(_ nums: [Int]) -> Int {
  let n = nums.count - 1
  var d = [Int](repeating: 1, count: n + 1)
  for i in 1 ... n {
    d[i] = 1
    for j in 0 ... i - 1 {
      if nums[j] < nums[i] && d[j] + 1 > d[i] {
        d[i] = d[j] + 1
      }
    }
  }
  
  return d.max()!
}
