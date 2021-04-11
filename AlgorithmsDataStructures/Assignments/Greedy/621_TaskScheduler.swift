//
//  621_TaskScheduler.swift
//  CompetitiveProgramming
//
//  Created by 杉原大貴 on 2021/04/09.
//

import Foundation

// LeetCode: https://leetcode.com/problems/task-scheduler/
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  if n == 0 { return tasks.count }
  
  var dic = [Character: Int]()
  for c in tasks {
    dic[c, default: 0] += 1
  }
  
  var pq = IndexPriorityQueue<CompTask>(>)
  for c in dic.keys {
    pq.enqueue(CompTask(c: c, count: dic[c]!))
  }
  
  var count = 0
  while !pq.isEmpty {
    var k = n + 1
    var temp = [CompTask]()
    while k > 0 && !pq.isEmpty {
      var top = pq.dequeue()!
      top.count -= 1
      temp.append(top)
      k -= 1
      count += 1
    }
    
    for e in temp {
      if e.count > 0 { pq.enqueue(e) }
    }
    
    if pq.isEmpty { break }
    count += k
  }
  
  return count
}

struct CompTask {
  let c: Character
  var count: Int
}

extension CompTask: Comparable {
  static func < (lhs: CompTask, rhs: CompTask) -> Bool {
    return lhs.count > rhs.count
  }
}

extension CompTask: Hashable {}
