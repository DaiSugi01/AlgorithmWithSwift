//
//  CourseSchedule.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/06.
//

import Foundation

// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
// You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
// For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
// Return true if you can finish all courses. Otherwise, return false.
// LeetCode link: https://leetcode.com/problems/course-schedule/
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  
  var indegree = [Int](repeating: 0, count: numCourses)
  var adj = [[Int]](repeating: [Int](), count: numCourses)
  
  for prerequisite in prerequisites {
    let u = prerequisite[0]
    let v = prerequisite[1]
    indegree[v] += 1
    adj[u].append(v)
  }

  let q = Queue<Int>()
  for i in 0 ..< indegree.count {
    if indegree[i] == 0 {
      q.enqueue(item: i)
    }
  }
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      indegree[v] -= 1
      if indegree[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }

  return indegree.reduce(0) { $0 + $1 } == 0
}

