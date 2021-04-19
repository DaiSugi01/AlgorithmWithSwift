//
//  first.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/16.
//

import Foundation

// LeetCode: https://leetcode.com/problems/is-subsequence/
func isSubsequence(_ s: String, _ t: String) -> Bool {
  
  var j = 0
  for c in t {
    if "\(c)" == "\(s[j, j + 1])" {
      j += 1
    }
    
    if j == s.count {
      return true
    }
  }
  
  return false
}
