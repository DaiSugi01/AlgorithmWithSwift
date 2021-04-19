//
//  53_MaximumSubarray.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/17.
//

import Foundation

// LeetCode: https://leetcode.com/problems/maximum-subarray/
func maxSubArray(_ nums: [Int]) -> Int {
  if nums.count == 1 { return nums[0] }
  
  var dp = [Int](repeating: 0, count: nums.count)
  dp[0] = nums[0]

  for i in 1 ..< nums.count {
    if nums[i] > dp[i - 1] + nums[i] {
      dp[i] = nums[i]
    } else {
      dp[i] = dp[i - 1] + nums[i]
    }
  }

  return dp.max()!
}
