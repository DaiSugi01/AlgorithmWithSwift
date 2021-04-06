//
//  SushiRestaurantReviews.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/24.
//

import Foundation

func sushiRestaurantReviewsTest(testMode: Bool = false, fileNameForInput: String = "") {

  // 0. get input
  var n = 0
  var realSushis = [Int]()
  var adjList = [[Int]]()
  var filePathForInput = ""
  
  if testMode {
    filePathForInput = "/Users/DKS/projects/Cornerstone/4_Swift/401/AlgorithmsDataStructures/AlgorithmsDataStructures/Assignments/testcase/sushiReview/" + fileNameForInput
    let contents = try! String(contentsOfFile: filePathForInput, encoding: .utf8)
    var lines = contents.split(separator: "\n")
    let input = lines[0].split(separator: " ").map { Int($0)! }
    n = input[0]
    realSushis = lines[1].split(separator: " ").map { Int($0)! }

    for _ in 0..<2 {
      lines.removeFirst()
    }
    adjList = [[Int]](repeating: [Int](), count: n)

    for line in lines {
      let nodes = line.split(separator: " ").map { Int($0)! }
      let u = nodes[0]
      let v = nodes[1]
      adjList[u].append(v)
      adjList[v].append(u)
    }
    
  } else {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    n = input[0]
    realSushis = readLine()!.split(separator: " ").map { Int($0)! }
    
    adjList = [[Int]](repeating: [Int](), count: n)
    for _ in 0..<n - 1 {
      let nodes = readLine()!.split(separator: " ").map { Int($0)! }
      let u = nodes[0]
      let v = nodes[1]
      adjList[u].append(v)
      adjList[v].append(u)
    }
  }
  
  
  let startTime = Date()
  
  // 1. find the unneccesary leaves
  var start = realSushis.min()!
  var removedTargets = Set<Int>()
  dfs(vertex: start, adjList: adjList, removedTargets: &removedTargets, realSushis: realSushis)
  
  // 2. find the deepest node to get a dimeter of tree
  var direction = [Int](repeating: 0, count: n)
  var visitedForBFS = [Bool](repeating: false, count: n)
  visitedForBFS[start] = true
  
  bfs(node: start, adjList: adjList, direction: &direction, visited: &visitedForBFS, removedTargets: removedTargets)
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
  let distance = edgeCount * 2 - diameter
  if testMode {
    var filePathForOutput = filePathForInput
    let temp = filePathForOutput.lastIndex(of: ".")!
    filePathForOutput = "\(filePathForOutput[...temp])out"
    
    let contents = try! String(contentsOfFile: filePathForOutput, encoding: .utf8)
    let answer = Int(contents.split(separator: "\n")[0])!

    let timeInterval = Date().timeIntervalSince(startTime)
    let ms = timeInterval * 100
    print("TEST \(fileNameForInput): \(distance == answer ? "pass" : "faild") \(ms) ms")
    
  } else {
    print("The Distance: \(distance)")
  }
  
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
         removedTargets: inout Set<Int>,
         realSushis: [Int]) {
  
  var visited = [Bool](repeating: false, count: adjList.count)
  visited[vertex] = true
  var linkedVertexCount = 0
  
  let stack = Stack<Int>()
  stack.push(item: vertex)
  
  while !stack.isEmpty() {
    let pop = stack.pop()!
    for v in adjList[pop] {
      if visited[v] {
        linkedVertexCount += 1
        continue
      }
      
      visited[v] = true
      stack.push(item: v)
    }
    
    // Add vertex to removedTarget when the last node is not real sushi restaurant
    if !realSushis.contains(pop) && linkedVertexCount == adjList[pop].count {
      removedTargets.insert(pop)
    }
    
    // Add vertex to removedTarget when there is no neccesary child node
    let removedCount = adjList[pop].filter { removedTargets.contains($0) }.count
    if !realSushis.contains(pop) && adjList[pop].count - removedCount == 1 {
      removedTargets.insert(pop)
    }

  }
}
