//
//  1029_TwoCityScheduling.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/08.
//

import Foundation

// LeetCode: https://leetcode.com/problems/two-city-scheduling/
func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  let newCost = costs.sorted { return ($0[0] - $0[1]) - ($1[0] - $1[1]) < 0}
  var sum = 0
  for i in 0 ..< newCost.count {
    let first = newCost[i][0]
    let second = newCost[i][1]
    sum += i < newCost.count / 2 ? first : second
  }
  
  return sum
}
