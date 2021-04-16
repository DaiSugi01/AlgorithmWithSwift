//
//  BellmanFord.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/13.
//

import Foundation

func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ m: Int, _ src: Int) -> [Int64] {
  var dist = [Int64](repeating: Int64(Int.max), count: n + 1) // 1-indexed
  dist[src] = 0
  
  var isNegativeCycle = false

  for i in 1 ... n {
    // relax all edges
    for j in 0 ..< m {
      let from = edges[j].u
      let to = edges[j].v
      let time = edges[j].w
      if dist[from] != Int.max && dist[from] + Int64(time) < dist[to] {
        dist[to] = dist[from] + Int64(time)
        if i == n {
          isNegativeCycle = true
        }
      }
    }
  }
  
  if isNegativeCycle {
    print(-1)
  } else {
    for i in 2 ... n {
      if dist[i] == Int.max {
        dist[i] = -1
      }
      print(dist[i])
    }
  }
  
  return dist
}

// SPFA Shortest oath faster algorithm


//func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int64] {
//  var dist = [Int64](repeating: Int64(Int.max), count: n + 1) // 1-indexed
//  dist[src] = 0
//
//  // N - 1 times
//  var isNegativeCycle = false
//  for _ in 0..<n-1 {
//    // relax all edges
//    for edge in edges {
//      if dist[edge.v] > dist[edge.u] + Int64(edge.w) {
//        dist[edge.v] = dist[edge.u] + Int64(edge.w)
//      }
//    }
//  }
//
//  return dist
//}
//
//// SPFA Shortest oath faster algorithm
