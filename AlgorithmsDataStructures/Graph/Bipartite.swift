//
//  Bipartite.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/23.
//

import Foundation

func birpartite() {
  func dfs(vertex: Int, color: Int, adjList: inout [[Int]], check: inout [Int]) {
    check[vertex] = color
    for v in adjList[vertex] {
      if check[v] == 0{
        dfs(vertex: v, color: 3 - color, adjList: &adjList, check: &check)
      }
    }
  }
  
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjList = [[(Int)]](repeating: [], count: n + 1)
  let tests = Int(readLine()!)!
  for _ in 0..<tests {
    // 1. adjacency list
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    // n x n
    var adjList = [[(Int)]](repeating: [], count: n + 1)
    
    for _ in 0 ..< m {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
      
      adjList[u].append(v)
      adjList[v].append(u)
    }
  }
  
  // 2. dfs -> coloring vertices
  var check = [Int](repeating: 0, count: n + 1)
  for v in 1...n {
    if check[v] == 0 {
      dfs(vertex: v, color: 1, adjList: &adjList, check: &check)
    }
  }
  
  // 3. check (verify)
//  for u in 1...n {
//    for b in 0..<adjList[u].count {
//      let next = adjList[u][v]
//    }
//  }
  
}
