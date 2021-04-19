//
//  1025_DivisorGame.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/17.
//

import Foundation

// LeetCode: https://leetcode.com/problems/divisor-game/
func maxProfit(_ prices: [Int]) -> Int {

  var i = 0
  var j = 1
  var maxDiff = 0
  
  var count = 0
  while i < prices.count && j < prices.count  {
    count += 1
    if prices[j] < prices[i] {
      i = j
      j += 1
      continue
    }
    
    maxDiff = max(prices[j] - prices[i], maxDiff)
    
    j += 1
  }
  
  return maxDiff
}
