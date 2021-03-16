//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var recCount = 0

func solveQueens(board: inout Board) {
  var col1 = [Bool](repeating: false, count: board.size)
  var col2 = [Bool](repeating: false, count: board.size * 2 - 1)
  var col3 = [Bool](repeating: false, count: board.size * 2 - 1)
  
  solveQueensHelper(board: &board, row: 0, col1: &col1, col2: &col2, col3: &col3)
  print("(... \(count) possible ways)")
  print("Number of recursive calls: \(recCount)")
}

func solveQueensHelper(board: inout Board,
                       row: Int,
                       col1: inout [Bool],
                       col2: inout [Bool],
                       col3: inout [Bool]) {
  
  recCount += 1

  if row == board.size {
    count += 1
    print(recCount)
    print(board)
    return
  }

  for j in 0..<board.size {
    if !col1[j] && !col2[row + j] && !col3[row - j + board.size-1 ] {
      
      board.place(row: row, col: j)
      col1[j] = true
      col2[row+j] = true
      col3[row-j + board.size - 1 ] = true
      
      solveQueensHelper(board: &board, row: row + 1, col1: &col1, col2: &col2, col3: &col3)
      
      board.remove(row: row, col: j)
      col1[j] = false
      col2[row+j] = false
      col3[row-j + board.size - 1 ] = false
    }
  }
}
