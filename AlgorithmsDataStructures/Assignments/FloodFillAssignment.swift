//
//  TomatoFarm.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/28.
//

import Foundation

/// tomato farm
/// Some of the tomatoes stored in his warehouse are ripe, but some may still be green(unripe).
/// Each day, unripe tomatoes adjacent to ripe tomatoes ripen under the influence of ripe tomatoes. (adjacent = left, right, front, back)
/// Tom wants to know if the tomatoes stored in the warehouse are ready to be cooked in a few days.
/// Given the size of the grid-shaped boxes and the information about ripe tomatoes and unripe tomatoes,
/// write a program to calculate how many days it takes for all the tomatoes to ripen.
func tomatoFarm() {
  
  struct Square {
    let x: Int
    let y: Int
  }
  
  let input = readLine()!.split(separator: " ")
  let n = Int(input[0])!
  let m = Int(input[1])!
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  var box = [[Int]]()
  var coloredTomatos = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
  
  for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    box.append(row)
  }
  
  func bfs(square: [Square]) {
    let queue = Queue<[Square]>()
    queue.enqueue(item: square)
    
    while !queue.isEmpty() {
      let squares = queue.dequeue()!
      var nextSq = [Square]()
      for sq in squares {
        let x = sq.x
        let y = sq.y
        
        for i in 0..<dx.count {
          let nx = x + dx[i]
          let ny = y + dy[i]
          
          // check the bounds
          if nx < 0 || nx >= n || ny < 0 || ny >= m {
            continue
          }
          
          if box[ny][nx] >= 0 && coloredTomatos[ny][nx] == 0 {
            coloredTomatos[ny][nx] = 1
            box[ny][nx] = 1
            nextSq.append(Square(x: nx, y: ny))
          }
        }
      }
      
      if !nextSq.isEmpty {
        queue.enqueue(item: nextSq)
        days += 1
      }
    }
  }
  
  // find riped tomatos
  var squares = [Square]()
  for x in 0..<n {
    for y in 0..<m {
      if box[y][x] == 1 {
        coloredTomatos[y][x] = 1
        squares.append(Square(x: x, y: y))
      }
    }
  }
  
  var days = 0
  bfs(square: squares)
  
  for row in box {
    if row.contains(0) {
      print(-1)
      return
    }
  }
  
  print("The minimum is \(days) days")
}

/// bridges
/// There’s a country made up of several islands. The president of this country promised people that he would build bridges to connect the islands.
/// However, after he got re-elected he started thinking that it would be a waste to build all the bridges.
/// One day he came to the conclusion that he can get away by building only one bridge (shortest). This country can be represented by N x N grid.
func bridges() {
  struct Square {
    let x: Int
    let y: Int
  }
  
  let n = Int(readLine()!)!
  var gridMap = [[Int]]()
  var coloredMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    gridMap.append(row)
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [-1, 1, 0, 0]
  
  func bfs(square: Square, id: Int) {
    let queue = Queue<Square>()
    queue.enqueue(item: square)
    coloredMap[square.x][square.y] = id
    
    while !queue.isEmpty() {
      let sq = queue.dequeue()!
      let x = sq.x
      let y = sq.y
      
      for i in 0..<dx.count {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        // check the bounds
        if nx < 0 || nx >= n || ny < 0 || ny >= n {
          continue
        }
        
        if gridMap[nx][ny] == 1 && coloredMap[nx][ny] == 0 {
          queue.enqueue(item: Square(x: nx, y: ny))
          coloredMap[nx][ny] = id
        }
      }
    }
  }
  
  var islandCount: Int
  var minCount = Int.max
  
  func findDistance(square: Square, id: Int) {
    let x = square.x
    let y = square.y
    
    if visited[x][y] == 1 { return }
    if islandCount >= minCount { return }
    visited[x][y] = 1
    
    for i in 0..<dx.count {
      let nx = x + dx[i]
      let ny = y + dy[i]
      
      // check the bounds
      if nx < 0 || nx >= n || ny < 0 || ny >= n {
        continue
      }
      
      // continue loop if it is already visited OR is the same id as the start point
      if visited[nx][ny] == 1 || coloredMap[nx][ny] == id {
        continue
      }
      
      // update minimum distance count if I find the other island
      if coloredMap[nx][ny] > 0 && coloredMap[nx][ny] != id && islandCount > 0 {
        minCount = min(minCount, islandCount)
        continue
      }
      
      if gridMap[nx][ny] == 0 {
        islandCount += 1
        findDistance(square: Square(x: nx, y: ny), id: id)
        visited[nx][ny] = 0
        islandCount -= 1
      }
    }
  }
  
  // coloring the islands
  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if gridMap[x][y] == 1 && coloredMap[x][y] == 0 {
        id += 1
        bfs(square: Square(x: x, y: y), id: id)
      }
    }
  }
 
  var visited: [[Int]]
  for x in 0..<n {
    for y in 0..<n {
      if coloredMap[x][y] > 0 {
        islandCount = 0
        let id = coloredMap[x][y]
        visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        findDistance(square: Square(x: x, y: y), id: id)
      }
    }
  }
  
  print("The minimum distance is \(minCount)")
}
