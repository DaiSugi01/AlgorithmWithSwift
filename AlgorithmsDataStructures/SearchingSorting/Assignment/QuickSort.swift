//
//  QuickSort.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/12.
//

import Foundation

func partition<T: Comparable>(_ arr: inout [T], _ low: Int, _ high: Int) -> Int {
  var i = low - 1
  let pivot = arr[high]
  
  for j in low..<high {
    if arr[j] <= pivot {
      i += 1
      arr.swapAt(i, j)
    }
  }
  arr.swapAt(i + 1, high)

  return i + 1
}

func quickSortHelper<T: Comparable>(_ arr: inout [T], _ low: inout Int, _ high: inout Int, _ comparator: (T, T) -> Bool) {

  if low >= high {
    return
  }

  let index = partition(&arr, low, high)
  var newLowIndex = index + 1
  var newHighIndex = index - 1
  
  quickSortHelper(&arr, &low, &newHighIndex, comparator)
  quickSortHelper(&arr, &newLowIndex, &high, comparator)
}

func quickSort<T: Comparable>(_ arr: inout [T], _ comparator: (T, T) -> Bool) -> [T] {
  var low = 0
  var high = arr.count - 1
  quickSortHelper(&arr, &low, &high, comparator)
  
  return arr
}
