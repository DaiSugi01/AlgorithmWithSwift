//
//  123.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

// LeetCode: https://leetcode.com/problems/find-center-of-star-graph/
func findCenter(_ edges: [[Int]]) -> Int {
  
  var adj = [[Int]](repeating: [Int](), count: edges.count + 2)
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  for i in 1 ..< adj.count {
    if adj[i].count > 1 {
      return i
    }
  }
  
  return -1
}
