//
//  1334_FindtheCityWiththeSmallestNumberofNeighborsatAThresholdDistance.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/15.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
  
  var d = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)
  
  var adj = [[(v: Int, w: Int)]](repeating: [(v: Int, w: Int)](), count: n)
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    let w = edge[2]
    adj[u].append((v: v, w: w))
    adj[v].append((v: u, w: w))
  }
  
  for i in 0 ..< adj.count {
    d[i][i] = 0
    for edge in adj[i] {
      d[i][edge.v] = edge.w
    }
  }
  
  for i in 0 ..< n {
    for j in 0 ..< n {
      for k in 0 ..< n {
        if (d[i][j] > d[i][k] + d[k][j]) {
          d[i][j] = d[i][k] + d[k][j]
        }

//        d[i][j] = min(d[i][k] + d[k][j], d[i][j])
      }
    }
  }
  
//  for i in d {
//    print(i)
//  }
  
  var minCnt = Int.max
  var res = 0
  for (i, dis) in d.enumerated() {
    let count = dis.filter { $0 <= distanceThreshold }.count - 1
    print(i, count, dis)
    print("***************************")
    if count <= minCnt {
      minCnt = count
      res = i
    }
  }
  
  return res
}
