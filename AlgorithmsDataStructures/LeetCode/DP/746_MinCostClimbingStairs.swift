//
//  746_MinCostClimbingStairs.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/17.
//

import Foundation

func minCostClimbingStairs(_ cost: [Int]) -> Int {
  var dp = [Int](repeating: 0, count: cost.count)
  
  dp[cost.count - 1] = cost[cost.count - 1]
  dp[cost.count - 2] = cost[cost.count - 2]

  var totalCost = 0
  for i in (0 ..< cost.count - 2).reversed() {
    var minCost = Int.max
    minCost =  min(cost[i] + dp[i + 1], cost[i] + dp[i + 2])
    dp[i] = minCost
    totalCost += minCost
  }  
  
  return min(dp[0], dp[1])
}
