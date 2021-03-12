//
//  ExhaustiveSearch.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-10.
//

import Foundation

func printBinaryExhaustiveHelper(_ n: Int, _ soFar: String = "", _ indent: String = "") {
  print(indent + #function + "[n=\(n), soFar=\(soFar)]")
  if n == 0 {
    // no more choices to make -> stop
    print(soFar)
  } else {
    // more choices to make
    // for all available choices 0, 1
    for i in 0 ... 1 {
      // choose one & recursively search
      printBinaryExhaustiveHelper(n - 1, soFar + "\(i)", indent + "  ")
    }
  }
}

/// printBinary(n) : prints all binary representations for n digits
/// - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n, "")
}


func printDecimalExhaustiveHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    // no more choices to make -> stop
    print(soFar)
  } else {
    // more choices to make
    // for all available choices 0 ~ 9
    for i in 0...9 {
      // choose one & recursively search
      printDecimalExhaustiveHelper(n - 1, soFar + "\(i)")
    }
  }
}

/// printDecimal(n) : prints all binary representations for n digits
/// - Parameter n: the number of digits
func printDecimalExhaustive(_ n: Int) {
  printDecimalExhaustiveHelper(n, "")
}


func permutationHelper(_ word: String, _ soFar: String = "", _ indent: String = "") {
  print(indent + #function + " [word=\(word), soFar=\(soFar)]")
  if word.count == 0 {
    // no more characters to choose -> stop
    print(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      permutationHelper(word[0, i] + word[i+1, word.count], soFar + c, indent + "  ")
    }
  }
}

/// Write a recursive function permutation that accepts a string as a parameter and ouputs
/// all possible rearrangements of the letters in the string.
/// - Parameter word: the string
func permutation(_ word: String) {
  var set = Set<String>() // HashSet
  permutationUnique(word, "", &set)
  for w in set {
    print(w)
  }
  //  permutationHelper(word)
}


func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      print(word[0, i] + word[i+1, word.count])
      permutationUnique(word[0, i] + word[i+1, word.count], soFar + c, &set)
    }
  }
}


func combinationsHelper(_ word: String, _ n: Int, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      combinationsHelper(word[0, 1] + word[i+1, 2], n - 1, soFar + c, &set)
    }
  }
}


func combinations(_ word: String, n: Int) {
  var set = Set<String>()
  combinationsHelper(word, n, "", &set)
  for w in set {
    print(w)
  }
}


func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  if n == 0{
    print(choices)
  } else {
    for i in 1 ... 6 {
      choices.append(i)
      rollDiceHelper(n - 1, choices: &choices)
      choices.removeLast()
    }
  }
}
