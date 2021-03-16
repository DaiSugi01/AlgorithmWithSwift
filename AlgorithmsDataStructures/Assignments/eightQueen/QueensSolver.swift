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
  solveQueensHelper(board: &board, row: 0)
  print("(... \(count) possible ways)")
  print("Number of recursive calls: \(recCount)")
}

func solveQueensHelper(board: inout Board, row: Int) {
  recCount += 1
  
  if row == board.size {
    count += 1
    print(recCount)
    print(board)
    return
  }
  
  for i in 0..<board.size {
    if board.isSafe(row: row, col: i) {
      board.place(row: row, col: i)
      solveQueensHelper(board: &board, row: row + 1)
      board.remove(row: row, col: i)
    }
  }
}
