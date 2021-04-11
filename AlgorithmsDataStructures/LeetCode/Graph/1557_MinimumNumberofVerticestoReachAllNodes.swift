//
//  1557_MinimumNumberofVerticestoReachAllNodes.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/08.
//

import Foundation

// Given a directed acyclic graph, with n vertices numbered from 0 to n-1,
// and an array edges where edges[i] = [fromi, toi] represents a directed edge from node fromi to node toi.
// Find the smallest set of vertices from which all nodes in the graph are reachable.
// It's guaranteed that a unique solution exists.
// Notice that you can return the vertices in any order.
// LeetCode: https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/
func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
  
  var indegree = [Int](repeating: 0, count: n)
  for edge in edges {
    let to = edge[1]
    indegree[to] += 1
  }

  var ans = [Int]()
  for i in 0 ..< indegree.count {
    if indegree[i] == 0 { ans.append(i) }
  }
  
  return ans
}
