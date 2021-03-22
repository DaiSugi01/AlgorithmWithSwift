//
//  DesignedAlgorithm.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/16.
//

import Foundation

/// Topic 1
/// - Parameter comparator: comparator '<' for ascending order or '>'  for descending order
func findElements(comparator: (Int, Int) -> Bool) {
  let n = 100
  let m = 3
  
  var arr = [Int](repeating: 0, count: n)
  for i in 0..<n {
    arr[i] = Int.random(in: 0...n*n)
  }
  let sortedArr = arr.sorted(by: comparator)
  print(sortedArr)
  
  var outputs = [Int]()
  
  for i in arr {
    findElementsHelper(num: i, m: m, outputs: &outputs, comparator: comparator)
  }
  
  
  print("*************** Runking **************")
  print(outputs)
  print("**************************************")
}


func findElementsHelper(num: Int, m: Int, outputs: inout [Int], comparator: (Int, Int) -> Bool) {
  if outputs.isEmpty {
    outputs.append(num)
    return
  }
  
  if outputs.count == m && !comparator(num, outputs[m-1]) {
    return
  }
  
  let index = binarySearch(arr: outputs,
                           left: 0,
                           right: outputs.count - 1,
                           target: num,
                           comparator: comparator)
  
  if outputs.count >= m {
    outputs.removeLast()
  }
  
  outputs.insert(num, at: index)
  
}

func binarySearch(arr: [Int], left: Int, right: Int, target: Int, comparator: (Int, Int) -> Bool) -> Int {
  if right < 0 { return 0 }
  
  if left > right {
    return comparator(target, arr[right]) ? right : right + 1
  }
  
  let mid = Int((left + right) / 2)
  
  if (target == arr[mid]) {
    return mid
  } else if (comparator(target, arr[mid])) {
    return binarySearch(arr: arr, left: left, right: mid - 1, target: target, comparator: comparator)
  } else {
    return binarySearch(arr: arr, left: mid + 1, right: right, target: target, comparator: comparator)
  }
}


/// Topic 2
/// - Parameters:
///   - targetWord: target word you want to find
///   - text: text of words
/// - Returns: index of the target word
func findWord(_ targetWord: String, _ text: String) -> Int {
  var i = 0
  var j = 0
  
  var firstLettersCount = 0
  for index in 0..<targetWord.count {
    if (targetWord[0] != targetWord[index]) { break }
    firstLettersCount += 1
  }
  
  while (i < text.count) {
    if j == targetWord.count { break }
    if targetWord[j] == text[i] {
      j += 1
    } else {
      if j != firstLettersCount || text[i] != targetWord[0] {
        j = 0
      }
    }
    i += 1
  }
  
  return (j > 0) ? i - j : -1
}
