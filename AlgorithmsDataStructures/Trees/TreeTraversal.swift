//
//  TreeTraversal.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/17.
//

import Foundation

func treetraversal() {
  var tree = [[Int]](repeating: [Int](repeating: 0, count: 2 ), count: 26)
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let nodeInfo = readLine()!.split(separator: " ").map { String( $0) }
    let parent = Int(Character(nodeInfo[0]).asciiValue!)
    let left = Int(Character(nodeInfo[0]).asciiValue!)
    let right = Int(Character(nodeInfo[0]).asciiValue!)
    
    tree[parent][0] = left == 46 ? -1 : left - 65
    tree[parent][1] = right == 46 ? -1 : right - 65
  }
  
  func preOrder(_ node: Int) {
    if node == -1 { return }
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][0])
    preOrder(tree[node][1])
  }
  
  func inOrder(_ node: Int) {
    preOrder(tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][1])
  }

  func postOrder(_ node: Int) {
    preOrder(tree[node][0])
    preOrder(tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
  }
  
  preOrder(0)
  print()
  inOrder(0)
  print()
  postOrder(0)
}

// rnwayReservation = [41, 46, 49, 56]
// currentTime = 37
// k = 3
// rnwayReservation(reservedTimes, _ k, currentTime, 44) -> false
// rnwayReservation(reservedTimes, _ k, currentTime, 53) -> true
// rnwayReservation(reservedTimes, _ k, currentTime, 20) -> false
// Time complexity: O(lg N)
func rnwayReservation(reservedTimes: [Int], _ k: Int, currentTime: Int, requestTime: Int) -> Bool {
  if requestTime < currentTime {
    return false
  }
  
  return true
}
