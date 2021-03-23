//
//  LCA.swift
//  AlgorithmsDataStructure
//
//  Created by Daiki on 2021/03/22.
//  with Chihori

import Foundation

func findLca() {
  let n = Int(readLine()!)!
  
  var adj = [[Int]](repeating: [], count: n + 1)
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  let n2 = Int(readLine()!)!
  
  var first: [Int] = []
  var second: [Int] = []
  var output: [Int] = []

  for _ in 0..<n2 {
    first.removeAll()
    second.removeAll()
    let targets = readLine()!.split(separator: " ").map { Int($0)! }
    
    first.append(1)
    findLcaHelper(adj, &first, targets[0], currentNode: 1)
    
    second.append(1)
    findLcaHelper(adj, &second, targets[1], currentNode: 1)
    
    var isFound = false
    while first.count != second.count {
      isFound = (first.count < second.count) ? compareVisited(&first, &second, &output) : compareVisited(&second, &first, &output)
      if isFound { break }
    }
    
    if isFound { continue }
    
    var i = first.count - 1
    while (i >= 0) {
      if first[i] == second[i] {
        output.append(first[i])
        break
      }
      i -= 1
    }
  }
  
  print("******* output *******")
  for lca in output {
    print(lca)
  }
  
}

@discardableResult
func findLcaHelper(_ adj: [[Int]], _ visited: inout [Int],_ target: Int, currentNode: Int) -> Bool {
  
  if currentNode == target {
    return true
  }
  
  for node in adj[currentNode] {
    if visited.contains(node) {
      continue
    }
    visited.append(node)
    let isFound = findLcaHelper(adj, &visited, target, currentNode: node)
    if isFound { return isFound }
    
    visited.removeLast()
  }
  
  return false
}

private func compareVisited(_ v1: inout [Int], _ v2: inout [Int], _ output: inout [Int]) -> Bool {
  if v1[v1.count - 1] == v2[v2.count - 1] {
    output.append(v1[v1.count - 1])
    return true
  } else {
    v2.removeLast()
    return false
  }
}
