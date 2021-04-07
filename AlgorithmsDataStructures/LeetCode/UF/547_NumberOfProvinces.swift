//
//  547_NumberOfProvinces.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

// There are n cities. Some of them are connected, while some are not.
// If city a is connected directly with city b, and city b is connected directly with city c,
// then city a is connected indirectly with city c.
// A province is a group of directly or indirectly connected cities and no other cities outside of the group.
// You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city
// and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
// LeetCode: https://leetcode.com/problems/number-of-provinces/
func findCircleNum(_ isConnected: [[Int]]) -> Int {
  
  var visited = [Bool](repeating: false, count: isConnected.count)
  
  var count = 0
  for i in 0 ..< isConnected.count {
    if !visited[i] {
      count += 1
      findCircleNumHelper(i, isConnected, &visited)
    }
  }
  
  return count
}


func findCircleNumHelper(_ node: Int, _ isConnected: [[Int]], _ visited: inout [Bool]) {
  
  let q = Queue<Int>()
  q.enqueue(item: node)
  
  while !q.isEmpty()  {
    let u = q.dequeue()!
    visited[u] = true
    for v in 0 ..< isConnected[u].count {
      if !visited[v] && isConnected[u][v] == 1 {
        findCircleNumHelper(v, isConnected, &visited)
      }
    }
  }
}
