//
//  DijkstraIPQ.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/12.
//

import Foundation

func DijkstraIPQ() {
  
  /// All vertices starting from 1 to n
  func dijkstra(_ adj: inout [[CompEdge]], _ src: Int) -> [Int] {
    let n = adj.count
    var dist = [Int](repeating: Int.max, count: n)
    dist[src] = 0
    var pq = IndexPriorityQueue<CompEdge>(<)
    for edge in adj[src] {
      pq.enqueue(CompEdge(v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
      if edge.w < dist[edge.v] {
        dist[edge.v] = edge.w
        for e in adj[edge.v] {
          pq.enqueue(CompEdge(v: e.v, w: e.w + edge.w))
        }
      }
    }
    return dist
  }
  
  var adj = [
    [],
    [CompEdge(v: 2, w: 2), CompEdge(v: 5, w: 5)],
    [CompEdge(v: 1, w: 2), CompEdge(v: 3, w: 3), CompEdge(v: 4, w: 8), CompEdge(v: 5, w: 1)],
    [CompEdge(v: 2, w: 3), CompEdge(v: 4, w: 1), CompEdge(v: 7, w: 4)],
    [CompEdge(v: 2, w: 8), CompEdge(v: 3, w: 1), CompEdge(v: 5, w: 4), CompEdge(v: 6, w: 1), CompEdge(v: 7, w: 5)],
    [CompEdge(v: 1, w: 5), CompEdge(v: 2, w: 1), CompEdge(v: 4, w: 5)],
    [CompEdge(v: 4, w: 1), CompEdge(v: 7, w: 1)],
    [CompEdge(v: 3, w: 4), CompEdge(v: 4, w: 5), CompEdge(v: 6, w: 1)]
  ]
  
  print(dijkstra(&adj, 1))
}
