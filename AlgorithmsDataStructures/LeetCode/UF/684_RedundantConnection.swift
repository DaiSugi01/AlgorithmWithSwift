//
//  684_.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
  let edgeCount = edges.count
  var uf = UF(edgeCount)
  var ans = [Int](repeating: 0, count: 2)
  
  for i in 0 ..< edgeCount {
    var first = edges[i][0]
    var second = edges[i][1]
    
    if !uf.union(first - 1, second - 1) {
      if first > second { swap(&first, &second) }
      ans[0] = first
      ans[1] = second
    }
  }
  
  return ans
}
