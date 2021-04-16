//  MinimumCostFlow.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/13.
//

import Foundation

func minimumCostFlow(testMode: Bool = false, filePath: String = "") {
  var buildings = 0
  var pipes = 0
  var enhancerStrength = 0
  var graph =  [[CompEdgeA]]()

  // 0. get an input
  if testMode {
    (graph, buildings, pipes, enhancerStrength) = getTestInput(from: filePath)
  } else {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    buildings = input[0]
    pipes = input[1]
    enhancerStrength = input[2]
    
    graph = [[(CompEdgeA)]](repeating: [CompEdgeA](), count: buildings + 1)
    for i in 0 ..< pipes {
      let input = readLine()!.split(separator: " ").map { Int($0)! }
      let u = input[0]
      let v = input[1]
      let cost = input[2]
      graph[u].append(CompEdgeA(from: u, to: v, cost: cost, isValid: i < buildings - 1))
    }
  }

  let start = Date()

  // 1. store all edges
  var allEdges = [CompEdgeA]()

  for node in graph {
    for edge in node {
      allEdges.append(edge)
    }
  }
  
  // 2. sort edges array by cost in asc
  allEdges.sort {
    if $0.cost == $1.cost {
      return $0.isValid
    } else {
      return $0.cost < $1.cost
    }
  }

  // 3. make MST by kruskal Algorithm
  var days = 0
  var uf = UF(graph.count)
  var set = Set<CompEdgeA>()
  var mstEdges = [CompEdgeA]()
  var maxCostEdge: CompEdgeA? = nil
  
  for edge in allEdges {
    if uf.connected(edge.from, edge.to) { continue }
    
    set.insert(edge)
    mstEdges.append(edge)
    maxCostEdge = edge

    // count up days if the pipe is inactive
    if !edge.isValid { days += 1 }
    
    // skip union when the edge is the biggest cost
    if mstEdges.count < buildings - 1 {
      uf.union(edge.from, edge.to)
    } else {
      break
    }
  }
    
  // MARK: Validation
  // terminate program if there is no enhancer
  if enhancerStrength == 0 {
    printResult(filePath: filePath, days: days, start: start, testMode: testMode)
    return
  }

  // terminate program if a last pipe in array which is the biggest cost is an active pipe
  if maxCostEdge!.isValid {
    printResult(filePath: filePath, days: days, start: start, testMode: testMode)
    return
  }

  // terminate program if a cost of a last pipe being applied enhancer is greater than 0
  let optCost = max(0, maxCostEdge!.cost - enhancerStrength)
  if optCost > 0 {
    printResult(filePath: filePath, days: days, start: start, testMode: testMode)
    return
  }

  // replace a node witch is the biggest cost
  for edge in allEdges {
    if set.contains(edge) { continue }
    let optCost = max(0, edge.cost - enhancerStrength)

    // decrease days by 1 when it finds a replaceable pipe
    if optCost == 0 && !uf.connected(edge.from, edge.to) {
      mstEdges.removeLast()
      mstEdges.append(edge)
      days -= 1
      printResult(filePath: filePath, days: days, start: start, testMode: testMode)
      return
    }
  }
}


/// get input from given test cases
/// - Parameter filePath: file path of test cases
/// - Returns: graph and a number of buildings, pipes, and enhancerStrength
private func getTestInput(from filePath: String) -> ([[CompEdgeA]], Int, Int, Int) {
  let contents = try! String(contentsOfFile: filePath, encoding: .utf8)
  let lines = contents.split(separator: "\n")

  let firstLine = lines[0].split(separator: " ").map { Int($0)! }
  let buildings = firstLine[0]
  let pipes = firstLine[1]
  let enhancerStrength = firstLine[2]

  var graph = [[CompEdgeA]](repeating: [CompEdgeA](), count: buildings + 1)

  for i in 1 ..< lines.count {
    let input = lines[i].split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let cost = input[2]

    graph[u].append((CompEdgeA(from: u, to: v, cost: cost, isValid: i < buildings)))
  }

  return (graph, buildings, pipes, enhancerStrength)
}

/// print result
/// - Parameters:
///   - filePath: file path of test cases
///   - days: output
///   - start: start time for calculate performance
///   - testMode: true: test mode, false: user input
private func printResult(filePath: String, days: Int, start: Date, testMode: Bool) {
  let elapsed = Date().timeIntervalSince(start)
  if testMode {
    var filePath = filePath[0, filePath.count - 2]
    filePath += "out"
    let contents = try! String(contentsOfFile: filePath, encoding: .utf8)
    let output = Int(contents.split(separator: "\n")[0])!
    let fileName = filePath[filePath.lastIndex(of: "/")!...]
    print("\(fileName): \(output == days ?  "pass": "failed") \(elapsed)")
  } else {
    print(days)
  }
}


struct CompEdgeA {
  let from: Int
  let to: Int
  let cost: Int
  var isValid: Bool
}

extension CompEdgeA: Equatable {
  static func ==(lhs: CompEdgeA, rhs: CompEdgeA) -> Bool {
    return lhs.from == rhs.from &&
      lhs.to == rhs.to &&
      lhs.cost == rhs.cost &&
      lhs.isValid == rhs.isValid
  }
}

extension CompEdgeA: Hashable {}
