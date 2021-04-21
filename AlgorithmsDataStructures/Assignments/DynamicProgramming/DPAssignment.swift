//
//  DPAssignment.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/19.
//

import Foundation

func makeOne(_ n: Int) {
  var d = [Int](repeating: 0, count: n + 1)
  
  d[1] = 0
  for i in 2 ..< d.count {
    d[i] = d[i - 1] + 1
    if i % 2 == 0 && d[i] > d[i / 2] + 1 {
      d[i] = d[i / 2] + 1
    }
    if i % 3 == 0 && d[i] > d[i / 3] + 1 {
      d[i] = d[i / 3] + 1
    }
  }
  print(d)
}

func nTiles(_ n: Int) {
  var d = [Int](repeating: 0, count: n + 1)
  
  d[1] = 1
  d[2] = 2
  
  for i in 3 ..< d.count {
    d[i] = d[i - 1] + d[i - 2]
  }
  
  print(d)
}

func nTiles2(_ n: Int) {
  var d = [Int](repeating: 0, count: n + 1)
  
  d[1] = 1
  d[2] = 3
  
  for i in 3 ..< d.count {
    d[i] = d[i - 1] + d[i - 2] * 2
  }
  
  print(d)
}

func oneTwoThree() {
  var t = Int(readLine()!)!
  var d = [Int](repeating: 0, count: 12)
  
  d[1] = 1
  d[2] = 2
  d[3] = 4
  
  for i in 4 ... 11 {
    d[i] = d[i - 1] + d[i - 2] + d[i - 3]
  }
  
  //  for i in 0 ..< t...count {
  print(d)
  //  }
}

func prettyNumber(_ n: Int) {
  var d = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for i in 0 ..< d.count {
    d[1][i] = 1
  }
  
  for i in 2 ..< n {
    for j in 0 ..< n {
      d[i][j] = d[i - 1][j - 1] + d[i - 1][j + 1]
    }
  }
  
}

func prettyNumbers2(_ n: Int) -> Int {
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
  for i in 1...9 {
    d[1][i] = 1
  }
  for i in 2...n {
    for j in 0...9 {
      d[i][j] = 0
      if j >= 1 {
        d[n][j] += d[n-1][j-1]
      }
      if j <= 8 {
        d[n][j] += d[n-1][j+1]
      }
    }
  }
  var ans = 0
  for i in 0...9 {
    // the number of pretty numbers with n digits that end with 0...9
    ans += d[n][i]
  }
  return ans
}

func nonDecreasingDigits(_ n: Int) -> Int {
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  for i in 0...9 {
    d[1][i] = 1
  }
  
  for i in 2...n {
    for j in 0...9 {
      for k in 0...j {
        d[i][j] += d[i-1][k]
      }
    }
  }
  
  var ans = 0
  for i in 0...9 {
    ans += d[n][i]
  }
  return ans
}

/*
 1. define the subproblem
 d[n] = the minimum number of squares needed to sum to N
 
 2. guessing
 d[1] = 1
 d[2] = 2
 d[3] = 3
 d[4] = 1
 ...
 d[n] = a^2 + b^2 + ... + d^2 + i^2 + j^2 1 <= j + j <= n
 d[n - j^2] = a^2 + b^2 + ... + d^2 + i^2 1 <= j + j <= n
 
 */
func SumOfSquareNumbers(_ n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  for i in 1 ... n {
    d[i] = i
    var j = 1
    while j * j <= i {
      if d[i] > d[i - j + j] + 1 {
        d[i] = d[i - j * j] + 1
      }
      j += 1
    }
  }
  print(d)
  return d[n]
}

func pokemon() {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let N = input[0]
  let M = input[1]
  
  var d = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
  for i in 0 ..< N {
    d[i] = readLine()!.split(separator: " ").map { Int($0)! }
    if i > 0 {
      d[i][0] = d[i][0] + d[i - 1][0]
    }
  }
  
  for i in 0 ..< N {
    for j in 1 ..< M {
      if i == 0 {
        d[i][j] = d[i][j] + d[i][j - 1]
      } else {
        d[i][j] = max(d[i - 1][j], d[i][j - 1]) + d[i][j]
      }
    }
  }

  print(d[N - 1][M - 1])
}

func numDecodings(_ s: String) -> Int {
  let n = s.count
  let digits = Array(s)
  var d = [Int](repeating: 0, count: s.count + 1)
  d[0] = 1
  print(digits)
  d[1] = digits[0] == "0" ? 0 : 1
  if n >= 2 {
    for i in 2...n {
      let firstDigit = Int("\(digits[i - 1])")!
      if firstDigit >= 1 {
        d[i] += d[i - 1]
      }
      let twoDigits = firstDigit + Int("\(digits[i - 2])")! * 10
      if twoDigits >= 10 && twoDigits <= 26 {
        d[i] += d[i - 2]
      }
    }
  }

  print(d)
  return d[n]
}

func maxSubArra(_ nums: [Int]) -> Int {
  if nums.count == 1 { return nums[0] }
  
  var dp = [Int](repeating: 0, count: nums.count)
  dp[0] = nums[0]
  
  for i in 1 ..< nums.count {
    if nums[i] > dp[i - 1] + nums[i] {
      dp[i] = nums[i]
    } else {
      dp[i] = dp[i - 1] + nums[i]
    }
  }
  
  return dp.max()!
}
