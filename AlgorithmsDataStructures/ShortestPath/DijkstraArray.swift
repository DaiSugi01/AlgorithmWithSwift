//
//  DijkstraArray.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/4/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// "Edge Relaxation"
/// dist[]: an array of elements representing distance(cost, weight)
/// For each edge (u, v)
///   if dist[v] > dist[u] + w(u, v)
///     dist[v] = dist[u] + w(u, v)

/// Dijkstra's Algorithm (Shortest Path)
/// - Greedy algorithm
func DijkstraArray() {
  struct Edge {
    let to: Int
    let weight: Int
  }
  
  /// All vertices starting from 1 to n
  func dijkstra(_ adj: inout [[Edge]], _ src: Int) -> [Int] {
    let n = adj.count
    var dist = [Int](repeating: Int.max, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    dist[src] = 0
    check[src] = true
    
    for _ in 0..<n-1 {
      // get the min dist vertex
      var min = Int.max
      var minVertex = 1
      for v in 1...n {
        if !check[v] && dist[v] < min {
          min = dist[v]
          minVertex = v
        }
      }
      // relax all neighbor edges
      check[minVertex] = true
      for edge in adj[minVertex] {
        let to = edge.to
        if dist[to] > dist[minVertex] + edge.weight {
          dist[to] = dist[minVertex] + edge.weight
        }
      }
    }
    return dist
  }
  
  var adj = [
    [],
    [Edge(to: 2, weight: 2), Edge(to: 5, weight: 5)],
    [Edge(to: 1, weight: 2), Edge(to: 3, weight: 3), Edge(to: 4, weight: 8), Edge(to: 5, weight: 1)],
    [Edge(to: 2, weight: 3), Edge(to: 4, weight: 1), Edge(to: 7, weight: 4)],
    [Edge(to: 2, weight: 8), Edge(to: 3, weight: 1), Edge(to: 5, weight: 4), Edge(to: 6, weight: 1), Edge(to: 7, weight: 5)],
    [Edge(to: 1, weight: 5), Edge(to: 2, weight: 1), Edge(to: 4, weight: 5)],
    [Edge(to: 4, weight: 1), Edge(to: 7, weight: 1)],
    [Edge(to: 3, weight: 4), Edge(to: 4, weight: 5), Edge(to: 6, weight: 1)]
  ]
  
  print(dijkstra(&adj, 1))
  /// * query shortest path
  ///
  /// let shortestPath = dijkstra(...)
  /// print(shortestPath[2]) // shortest path from src to vertex 2
}
