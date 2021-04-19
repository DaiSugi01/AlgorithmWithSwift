//
//  743_NetworkDelayTime.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/14.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
  
  var adj = [[CompEdge]](repeating: [CompEdge](), count: n + 1)
  
  for edge in times {
    let u = edge[0]
    let v = edge[1]
    let w = edge[2]
    adj[u].append(CompEdge(v: v, w: w))
  }
  
  var dist = [Int](repeating: Int.max, count: n + 1)
  dist[0] = 0
  dist[k] = 0
  
  var pq = IndexPriorityQueue<CompEdge>(<)
  pq.enqueue(CompEdge(v: k, w: 0))
  
  for edge in adj[k] {
    pq.enqueue(CompEdge(v: edge.v, w: edge.w))
  }

  while !pq.isEmpty {
    let edge = pq.dequeue()!
    if edge.w < dist[edge.v] {
      dist[edge.v] = edge.w
      for e in adj[edge.v] {
        pq.enqueue(CompEdge(v: e.v, w: e.w + edge.w))
      }
    }
  }

  return dist.max()! == Int.max ? -1 : dist.max()!
}

struct CompEdge1: Comparable, Hashable {
  static func < (lhs: CompEdge1, rhs: CompEdge1) -> Bool {
    return lhs.w < rhs.w
  }
  
  var v: Int // destination
  var w: Int // weight
}
