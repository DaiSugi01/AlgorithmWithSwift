//
//  547_NumberOfProvinces.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/07.
//

import Foundation

// There are n cities. Some of them are connected, while some are not.
// If city a is connected directly with city b, and city b is connected directly with city c,
// then city a is connected indirectly with city c.
// A province is a group of directly or indirectly connected cities and no other cities outside of the group.
// You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city
// and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
// LeetCode: https://leetcode.com/problems/number-of-provinces/
// input: [[1,1,0],[1,1,0],[0,0,1]]
// output: 2
func findCircleNum(_ isConnected: [[Int]]) -> Int {
    
    var uf = UF(isConnected.count)
    var count = isConnected.count
    
    for i in 0 ..< isConnected.count {
        for j in 0 ..< isConnected.count {
            if isConnected[i][j] == 1 && uf.union(i, j) {
                count -= 1
            }
        }
    }
  
    return count
}
