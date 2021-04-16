//
//  MinimumCostFlow.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/13.
//

import Foundation

func minimumCostFlow() {
  
  struct CompEdge {
    
    static func < (lhs: CompEdge, rhs: CompEdge) -> Bool {
      return true
    }
    
    let to: Int
    let cost: Int
    var isValid: Bool
  }

  
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let buildings = input[0]
  let pipes = input[1]
  let enhancerStrength = input[2]
  var totalCost = 0
  
  var adj = [[CompEdge]](repeating: [CompEdge](), count: buildings + 1)
  for i in 0 ..< pipes {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    let cost = input[2]
    adj[from].append(CompEdge(to: to, cost: cost, isValid: i < buildings - 1))
//    adj[to].append(CompEdge(to: from, cost: cost, isValid: i < buildings - 1))
    totalCost += cost
  }

  print(totalCost)

  var days = 0
  var total = 0
  var uf = UF(adj.count)
  var pqForActive = IndexPriorityQueue<Int>(<)
  var pqForInactive = IndexPriorityQueue<Int>(>)
  
  for i in 1 ..< adj.count {
    for j in 0 ..< adj[i].count {
      if !adj[i][j].isValid {
        pqForInactive.enqueue(adj[i][j].cost)
        continue
      }
      if uf.union(i, adj[i][j].to) {
        total += adj[i][j].cost
        pqForActive.enqueue(adj[i][j].cost)
        print("success connect \(adj[i][j])")
      } else {
        print("can't connect \(adj[i][j])")
      }
    }
    print("***********************:")
  }
  
  while !pqForInactive.isEmpty {
    let inactiveNode = pqForInactive.dequeue()!
    let activeNode = pqForActive.dequeue()!
    if inactiveNode < activeNode {
      total -= activeNode
      total += inactiveNode
      days += 1
    } else {
      break
    }
  }
  
  print(total)
}
