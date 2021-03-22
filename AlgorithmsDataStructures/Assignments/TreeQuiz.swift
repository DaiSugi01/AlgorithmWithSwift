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
//  let nodeInfo = [
//    [ [3, 2] ],
//    [ [4, 4] ],
//    [ [1, 2], [4, 3] ],
//    [ [2, 4], [3, 3], [5, 6] ],
//    [ [4, 6] ]
//  ]
  
  let nodeInfo = [
    [ [3, 2] ],
    [ [4, 4] ],
    [ [1, 2], [4, 3], [6 ,2] ],
    [ [2, 4], [3, 3], [5, 6] ],
    [ [4, 6] ],
    [ [3, 2], [7, 4] ],
    [ [6, 4], [8, 5] ],
    [ [7, 5] ]
  ]

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

func diameterHelper(node: [[Int]], nodeInfo: [[[Int]]], visited: inout [Int]) -> Int {
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

