//
//  70_ClimbingStairs.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/17.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
  if n <= 2 { return n }
  
  var dp = [Int](repeating: 0, count: n)
  dp[0] = 1
  dp[1] = 2
  
  for i in 2 ..< n {
    dp[i] = dp[i - 1] + dp[i - 2]
  }

  return dp[n - 1]
}
