//
//  DFS.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/23.
//

import Foundation

func adjacencyListDFS() {
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
  
  func dfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[vertex] = true
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v] {
        dfs(vertex: v, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  dfs(vertex: 1, adjList: &adjList, visited: &visited)
}

/**
 0 1
 0 2
 2 3
 4 3
 6 1
 1 5
 7 3

 */
