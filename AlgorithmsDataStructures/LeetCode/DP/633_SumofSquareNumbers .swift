//
//  633_SumofSquareNumbers .swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/04/20.
//

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
  var d = [Int](repeating: 0, count: c + 1)

  let c = Int(sqrt(Double(c)))
  for i in 0 ... c {
    d[i] = i * i
    if d.contains(c - d[i]) {
      return true
    }
  }
  
  return false
  
  let sqrtc = Int(sqrt(Double(c)))
  var a = 0
  var b = sqrtc

}


/*
 d = [1, 4, 9]
 a^2 + b^2 = c
 c - a^2 = b^2
 */
