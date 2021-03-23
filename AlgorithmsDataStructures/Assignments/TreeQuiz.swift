////
////  TreeQuiz.swift
////  AlgorithmsDataStructures
////
////  Created by 杉原大貴 on 2021/03/18.
////
//
import Foundation

func findParent() {
  print("How many nodes?")
  let n = Int(readLine()!)!


  var output = [Int](repeating: 0, count: n)
  output[0] = 1
  for _ in 1..<n {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }

    let firstNode = inputs[0]
    let secondNode = inputs[1]

    if output[firstNode - 1] > 0 {
      output[secondNode - 1] = firstNode
    } else {
      output[firstNode - 1] = secondNode
    }
  }

  print("********** Parent Node **********")
  for (index, num) in output[1...].enumerated() {
    print("Node\(index): \(num)")
  }
  
}


func diameter() {
  let nodeInfo = getUserInput()

  var maxDistance = 0
  var visited: [Int] = []

  for (index, eachNode) in nodeInfo.enumerated() {
    visited.append(index + 1)
    let distance = diameterHelper(node: eachNode, nodeInfo: nodeInfo, visited: &visited)
    visited.removeFirst()
    maxDistance = max(distance, maxDistance)
  }

  print(maxDistance)
}

private func diameterHelper(node: [[Int]], nodeInfo: [[[Int]]], visited: inout [Int]) -> Int {
  var totalDistance: Int = 0
  var maxDistance: Int = 0
    
  for eachNode in node {

    print("visited: \(visited)")
    print("node: \(eachNode[0]), distance: \(eachNode[1])")

    if visited.contains(eachNode[0]) {
      totalDistance += eachNode[1]
      maxDistance = max(maxDistance, totalDistance)
      continue
    }
    
    let linkedNode = eachNode[0]
    
    visited.append(linkedNode)
    totalDistance += diameterHelper(node: nodeInfo[linkedNode - 1], nodeInfo: nodeInfo, visited: &visited)
    visited.removeLast()
    maxDistance = max(maxDistance, totalDistance)
    totalDistance = 0
  }

  print("******** MAX DISTANCE: \(maxDistance) ********")
  return maxDistance
}

private func getUserInput() -> [[[Int]]] {
  let vConut = Int(readLine()!)!
  var nodeInfo = [[[Int]]](repeating: [[Int]](), count: vConut)
  
  for _ in 0 ..< vConut {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let v = input[0]

    var j = 1
    while j < input.count {
      if input[j] == -1 { break }
      nodeInfo[v - 1].append([input[j], input[j+1]])
      j += 2
    }
  }
  
  return nodeInfo
}

func test1() {
  let n = Int(readLine()!)!
  var adj = [[Int]](repeating: [], count: n + 1)
  for _ in 0 ..< n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  print(adj)
}
