//
//  CourseScheduleII.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/06.
//

import Foundation

// There are a total of n courses you have to take labelled from 0 to n - 1.
// Some courses may have prerequisites, for example, if prerequisites[i] = [ai, bi] this means you must take the course bi before the course ai.
// Given the total number of courses numCourses and a list of the prerequisite pairs, return the ordering of courses you should take to finish all courses.
// If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.
// LeetCode link: https://leetcode.com/problems/course-schedule-ii/
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  
  // varidation
  var answerOrder = [Int]()
  if prerequisites.isEmpty {
    for i in (0..<numCourses).reversed() {
      answerOrder.append(i)
    }
    return answerOrder
  }
  
  // 0. get user input
  var adj = [[Int]](repeating: [Int](), count: numCourses)
  var indegree = [Int](repeating: 0, count: numCourses)
  
  for course in prerequisites {
    let u = course[0]
    let v = course[1]
    indegree[u] += 1
    adj[v].append(u)
  }
  
  // 1. find the vertex which don't have indegree and enqueue it
  let q = Queue<Int>()
  for i in 0 ..< indegree.count {
    if indegree[i] == 0 {
      q.enqueue(item: i)
    }
  }
  
  // 2. process verteies
  while !q.isEmpty() {
    let u = q.dequeue()!
    if !answerOrder.contains(u) {
      answerOrder.append(u)
    }
    
    for v in adj[u] {
      indegree[v] -= 1
      if indegree[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
  
  return indegree.reduce(0) { $0 + $1 } == 0 ? answerOrder: []
}
