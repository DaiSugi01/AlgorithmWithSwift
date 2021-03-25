//
//  Town.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/24.
//

import Foundation

func town() {
  struct Square {
    let x: Int
    let y: Int
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
    
  var townMap = [[Int]]()
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    townMap.append(row)
  }
  
  func bfs(square: Square, id: Int) {
    let q = Queue<Square>()
    q.enqueue(item: square)
    coloredMap[square.x][square.y] = id
    houses[id] += 1
    
    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]
        
        if nextX > 0 && nextX < n && nextY >= 0 && nextY < n {
          if townMap[nextX][nextY] == 1 && coloredMap[nextX][nextY] == 0 {
            q.enqueue(item: Square(x: nextX, y: nextY))
            coloredMap[nextX][nextY] = id
            houses[id] += 1
          }
        }
      }
    }
  }

  var coloredMap = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
  var houses = [Int](repeating: 0, count: 25 * 25)

  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && coloredMap[x][y] == 0 {
        id += 1
        bfs(square: Square(x: x, y: y), id: id)
      }
    }
  }
  
  print(id)
  
  houses = Array(houses[1...id])
  houses.sort()
  for house in houses {
    print(house)
  }
}
