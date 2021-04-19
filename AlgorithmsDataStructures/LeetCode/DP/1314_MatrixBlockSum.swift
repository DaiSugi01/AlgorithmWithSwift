//
//  1314_MatrixBlockSum.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/18.
//

import Foundation

func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
  
  var dp = [[Int]](repeating: [Int](repeating: 0, count: mat.count), count: mat.count)
  for i in 0 ..< mat.count {
    let startR = max(0, i - k)
    let lastR = i + k

    dp[i][0] = mat[i][0]

    for j in 1 ..< mat.count {
      let startC = max(0, j - k)
      let lastC = j + k

      dp[i][j] = dp[i][j - 1] + mat[i][j]
    }

  }

  return [[1]]
}
