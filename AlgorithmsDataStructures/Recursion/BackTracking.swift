//
//  BackTracking.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/11.
//

import Foundation

func rollDiceSum(n: Int, desiredSum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, 5,choices: &choices)
}

func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, choices: inout [Int]) {
  if n == 0 {
    print(choices)
  } else {
    for i in 1 ... 6 {
      // shoose i, and the remaining desired sum should be between 1 * (n-1) <= sum <= 6 * (n-1)
      if i + (n - 1) * 1 <= desiredSum && desiredSum <= i + (n - 1) * 6 {
        choices.append(i)
        rollDiceSumHelper(n - 1, desiredSum - i, choices: &choices)
        choices.removeLast()
      }
    }
  }
}


func rollDiceSumUnique(n: Int, desiredSum: Int) {
  var choices = [Int]()
  var set = Set<Int>()
  rollDiceSumUniqueHelper(n: n, desiredSum: desiredSum, soFar: 0, choices: &choices, set: &set)
}

func rollDiceSumUniqueHelper(n: Int, desiredSum: Int, soFar: Int, choices: inout [Int], set: inout Set<Int>) {
  if n == 0 {
    let uniqueId = choices.reduce(1) { $0 * $1 }
    if desiredSum == soFar && !set.contains(uniqueId){
      set.insert(uniqueId)
      print(choices)
    }
  } else {
    for i in 1...6 {
      if soFar + i + (n - 1) * 1 <= desiredSum && desiredSum <= soFar + i + (n - 1) * 6 {
        choices.append(i)
        rollDiceSumUniqueHelper(n: n - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices, set: &set)
        choices.removeLast()
      }
    }
  }
}
