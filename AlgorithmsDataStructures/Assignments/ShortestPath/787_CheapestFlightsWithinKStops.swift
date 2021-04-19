//
//  787_CheapestFlightsWithinKStops.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/15.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
  
  var adj = [[(v: Int, w: Int)]](repeating: [(v: Int, w: Int)](), count: n)
  for flight in flights {
    let u = flight[0]
    let v = flight[1]
    let w = flight[2]
    adj[u].append((v: v, w: w))
  }
  
  var pq = IndexPriorityQueue<CompEdgePrice>(>)
  pq.enqueue(CompEdgePrice(v: src, w: 0, stop: K + 1))
  
  while !pq.isEmpty {
    let edge = pq.dequeue()!
    if edge.v == dst { return edge.w }
    
    if edge.stop > 0 {
      for nextEdge in adj[edge.v] {
        pq.enqueue(CompEdgePrice(v: nextEdge.v, w: nextEdge.w + edge.w, stop: edge.stop - 1))
      }
    }
  }
  
  return -1
}

public struct CompEdgePrice {
  var v: Int // destination
  var w: Int // weight
  var stop: Int
}

extension CompEdgePrice: Comparable {
  public static func <(lhs: CompEdgePrice, rhs: CompEdgePrice) -> Bool {
    if lhs.w == rhs.w {
      return lhs.v < rhs.v
    } else {
      return lhs.w < rhs.w
    }
  }
}

extension CompEdgePrice: Hashable {}
