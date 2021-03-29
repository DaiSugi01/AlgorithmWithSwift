//
//  TomatoFarm.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/28.
//

import Foundation

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
//  var tomatos = [Int](repeating: 0, count: n * m)

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


      for (index, a) in box.enumerated() {
        print(index, a)
      }
      print(days)
      print("****************")
      
    }
  }
  
  var squares = [Square]()
  
  outer: for x in 0..<n {
    for y in 0..<m {
      if box[y][x] == 1 {
        coloredTomatos[y][x] = 1
        squares.append(Square(x: x, y: y))
      }
    }
  }
  
//  if startX < 0 || startY < 0 {
//    print(-1)
//    return
//  }
  
  var days = 0
  bfs(square: squares)
  
  for row in box {
    if row.contains(0) {
      print(-1)
      return
    }
  }
  
  print(days)
}
