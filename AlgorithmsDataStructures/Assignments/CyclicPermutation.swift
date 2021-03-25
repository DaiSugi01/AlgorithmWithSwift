//
//  CyclicPermutation.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/24.
//

import Foundation


/// CyclicPermutation
/// There are several ways to represent a permutation of N integers from 1 to N.
///  For example, a permutation of 8 elements (3, 2, 7, 8, 1, 4, 5, 6) can be represented
func cyclicPermutation() {
  
  let n = Int(readLine()!)!
  var nodes: [Int]
  
  for _ in 0..<n {
    var count = 0
    let nodeNum = Int(readLine()!)!
    var visited = [Bool](repeating: false, count: nodeNum + 1)
    nodes = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.insert(0, at: 0)
    
    for i in 1..<nodes.count {
      if visited[i] { continue }

      let q = Queue<Int>()
      q.enqueue(item: nodes[i])
      visited[i] = true
      while !q.isEmpty() {
        let vertex = q.dequeue()!
        if visited[vertex] { break }
        visited[vertex] = true
        q.enqueue(item: nodes[vertex])
      }
      count += 1
    }
    
    print(count)
  }
}


/// Description
func repeatingSequence() {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let a = input[0]
  let p = input[1]
  
  var sums = [Int]()
  var sum = a
  while !sums.contains(sum) {
    sums.append(sum)
    let num = sum
    var rest = num
    sum = 0
    if num / 10 > 0 {
      while rest > 0 {
        sum += Int(pow(Double(rest % 10), Double(p)))
        rest = rest / 10
      }
    } else {
      sum = Int(pow(Double(num), Double(p)))
    }
  }

  print(sums.firstIndex(of: sum)!)
}
