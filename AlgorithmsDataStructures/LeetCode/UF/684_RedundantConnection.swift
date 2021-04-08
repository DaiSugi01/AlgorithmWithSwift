//
//  684_.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
  var uf = UF(edges.count)
  var ans = [Int](repeating: 0, count: 2)
  
  for i in 0 ..< edges.count {
    for edge in edges[i] {
      if !uf.union(i, edge - 1) {
        ans[0] = i
        ans[1] = edge
      }
    }
  }
  
  return ans
}
