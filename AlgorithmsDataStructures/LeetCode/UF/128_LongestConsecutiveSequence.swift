//
//  128_LongestConsecutiveSequence.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

//func longestConsecutive(_ nums: [Int]) -> Int {
//  var set = Set<Int>()
//  for num in nums {
//    set.insert(num)
//  }
//  var longestStreak = 0
//
//  for num in set {
//    if !set.contains(num - 1) {
//      var currentNum = num
//      var currentStreak = 1
//
//      while set.contains(currentNum + 1) {
//        currentNum += 1
//        currentStreak += 1
//      }
//
//      longestStreak = max(longestStreak, currentStreak)
//    }
//  }
//
//  return longestStreak
//}

func longestConsecutive(_ nums: [Int]) -> Int {
  
  var uf = UF(nums.count)
  var set = Set<Int>()
  
  for i in 0 ..< nums.count {
    if set.contains(nums[i]) { continue }
    
    if set.contains(nums[i] - 1) {
      uf.union(i, nums[i] - 1)
    }
    
    if set.contains(nums[i] + 1) {
      uf.union(i, nums[i] + 1)
    }
    
    set.insert(nums[i])
  }

  return 1
}
