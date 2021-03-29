//
//  SushiRestaurantReviews.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/24.
//

import Foundation

func sushiRestaurantReviews() {
  // 0. get user input
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let n = input[0]
  let realSushis = readLine()!.split(separator: " ").map { Int($0)! }
  
  var adjList = [[Int]](repeating: [Int](), count: n)
  for _ in 0..<n - 1 {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let u = nodes[0]
    let v = nodes[1]
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  // 1. find the unneccesary leaves
  var start = realSushis[0]
  var visited = [Bool](repeating: false, count: n)
  var removedTargets = Set<Int>()
  dfs(vertex: start, adjList: adjList, visited: &visited, removedTargets: &removedTargets, realSushis: realSushis)
  
  // 2. find the deepest node to get a dimeter of tree
  var direction = [Int](repeating: 0, count: n)
  var visitedForBFS = [Bool](repeating: false, count: n)
  visitedForBFS[start] = true
  
  bfs(node: start, adjList: adjList, direction: &direction, visited: &visitedForBFS, removedTargets: removedTargets)
  print(direction)
  for i in 1..<n {
    if direction[i] > direction[start] {
      start = i
    }
  }

  // 3. find the diameter of tree
  var visitedForBFS2 = [Bool](repeating: false, count: n)
  var direction2 = [Int](repeating: 0, count: n)
  visitedForBFS2[start] = true
    
  bfs(node: start, adjList: adjList, direction: &direction2, visited: &visitedForBFS2, removedTargets: removedTargets)
  let diameter = direction2.max()!
  let edgeCount = direction2.count - removedTargets.count - 1
  
  // print out the output which is "(the number of edge) * 2 - diameter"
  print("The Distance: \(edgeCount * 2 - diameter)")
}

private func bfs(node: Int,
         adjList: [[Int]],
         direction: inout [Int],
         visited: inout [Bool],
         removedTargets: Set<Int>) {
  let queue = Queue<Int>()
  queue.enqueue(item: node)
  
  while !queue.isEmpty() {
    let v = queue.dequeue()!
    for edge in adjList[v] {
      
      // if already visited, continue loop
      if visited[edge] { continue }

      // if the edge is a removed Target, continue loop
      if removedTargets.contains(edge) {
        visited[edge] = true
        continue
      }
      
      direction[edge] = direction[v] + 1
      queue.enqueue(item: edge)
      visited[edge] = true
    }
  }
}

private func dfs(vertex: Int,
         adjList: [[Int]],
         visited: inout [Bool],
         removedTargets: inout Set<Int>,
         realSushis: [Int]) {
  
  visited[vertex] = true
  var linkedVertexCount = 0
  
  for v in adjList[vertex] {
    if visited[v] {
      linkedVertexCount += 1
      continue
    }
    dfs(vertex: v, adjList: adjList, visited: &visited, removedTargets: &removedTargets, realSushis: realSushis)
  }
  
  // Add vertex to removedTarget when the last node is not real sushi restaurant
  if !realSushis.contains(vertex) && linkedVertexCount == adjList[vertex].count {
    removedTargets.insert(vertex)
  }
  
  // Add vertex to removedTarget when there is no neccesary child node
  let removedCount = adjList[vertex].filter { removedTargets.contains($0) }.count
  if !realSushis.contains(vertex) && adjList[vertex].count - removedCount == 1 {
    removedTargets.insert(vertex)
  }
}
