//
//  134_GasStation.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/10.
//

import Foundation

// LeetCode: https://leetcode.com/problems/gas-station/
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  
  var tank = 0, diff = 0, res = 0
  var i = 0
  
  while i < gas.count {
    tank += gas[i] - cost[i]
    diff += gas[i] - cost[i]
    
    if tank < 0 {
      res = i + 1
      tank = 0
    }
    i += 1
  }
  
  return diff >= 0 ? res : -1
}
