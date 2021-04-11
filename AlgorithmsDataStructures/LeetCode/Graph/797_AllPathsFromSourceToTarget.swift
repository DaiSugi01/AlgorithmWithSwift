//
//  797._AllPathsFromSourceToTarget.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

// LeetCode: https://leetcode.com/problems/all-paths-from-source-to-target/
func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
  
  var ans = [[Int]]()
  var direction = [0]
 
  func dfs(u: Int) {
    if u == graph.count - 1 {
      ans.append(direction)
      return
    }

    for v in graph[u] {
      direction.append(v)
      dfs(u: v)
      direction.removeLast()
    }
  }

  dfs(u: 0)

  return ans
}
