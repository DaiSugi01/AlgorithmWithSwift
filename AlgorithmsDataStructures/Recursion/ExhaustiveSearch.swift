//
//  ExhausitiveSearch.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/10.
//

import Foundation


/// printbinary(n): prints all binary representations for n digits
/// - Parameter n: the number of digits
func printBinaryExhaustiveHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0 ... 1 {
      printBinaryExhaustiveHelper(n - 1, soFar + "\(i)")
    }
  }
}

func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n, "")
}


func printDecimalHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0 ... 9 {
      printDecimalHelper(n - 1, soFar + "\(i)")
    }
  }
}

func printDecimal(_ n: Int) {
  printDecimalHelper(n)
}



/// A recursive function permutation that accepts a string as a parameter and outputs
/// all possible rearrangements of the letters in the string
/// - Parameter word: the string
func permutaionHealper(_ word: String, _ soFar: String = "") {
  if word.count == 0 {
    print(soFar)
  } else {
    for i in 0..<word.count {
      let chose = word[i]
      permutaionHealper(word[0, i] + word[i + 1, word.count], soFar + chose)
    }
  }
}


func permutaion(_ word: String) {
  permutaionHealper(word)
}
