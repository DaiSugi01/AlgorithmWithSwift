//
//  TreeAssignment.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-22.
//

import Foundation

// 1. who's my parent
func whosMyParent() {
  // input spec
  let n = Int(readLine()!)!
  // where / how to store the input? (data structure)
  // -> adjacency list
  var adj = [[Int]](repeating: [], count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  
  // first sample input: [[], [6, 4], [4], [5, 6], [1, 2, 7], [3], [3, 1], [4]]
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  // how to solve the problem? (algorithm)
  // search level by level (breadth first search)
  // root is 1
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        check[v] = true
        parent[v] = u
        q.enqueue(item: v)
      }
    }
  }
  // output spec
  for i in 2...n {
    print(parent[i])
  }
}

func diameterAnswer() {
  struct Edge {
    let to: Int
    let distance: Int
  }
  
  func bfs(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Edge]]) {
    let q = Queue<Int>()
    check[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
      let x = q.dequeue()!
      for edge in adjList[x] {
        if !check[edge.to] {
          distances[edge.to] = distances[x] + edge.distance
          q.enqueue(item: edge.to)
          check[edge.to] = true
        }
      }
    }
  }
  
  let n = Int(readLine()!)!
  var adjList = [[Edge]](repeating: [], count: n + 1)
  
  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let from = line[0]
    var j = 1
    while j < line.count - 2 {
      let to = line[j]
      let dist = line[j + 1]
      adjList[from].append(Edge(to: to, distance: dist))
      if line[j + 2] == -1 {
        break
      }
      j += 2
    }
  }
  
  var start = 1
  var check = [Bool](repeating: false, count: n + 1)
  var distances = [Int](repeating: 0, count: n + 1)
  bfs(node: start, check: &check, distances: &distances, adjList: &adjList)
  print(distances)

  for i in 2...n {
    if distances[i] > distances[start] {
      start = i
    }
  }
  var check2 = [Bool](repeating: false, count: n + 1)
  var distances2 = [Int](repeating: 0, count: n + 1)
  bfs(node: start, check: &check2, distances: &distances2, adjList: &adjList)
  print(distances2)

  print(distances2.max()!) // the max value in distances2
}
