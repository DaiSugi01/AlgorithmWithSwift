//
//  Recursion.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/09.
//

import Foundation

// 1. power(base, exponent) -> base~exponent
// Assume exponet >= 0
func power(base: Int, exponent: Int) -> Int {
  if exponent == 0 {
    return 1
  }
  
  return base * power(base: base, exponent: exponent - 1)
}

// checks if a word is a palindrome
// Assume exponet >= 0
func isPalindrome(_ word: String) -> Bool {
  if word.count <= 1 { return true }
  
  if let first = word.first, let last = word.last, first == last {
    return isPalindrome(word[1, word.count - 1])
  }

  return false
}

func printBinary(num: Int) {
  if num < 0 {
    print("-", terminator: "")
    printBinary(num: -num)
    return
  }
  
  if num < 2 {
    print(num, terminator: "")
    return
  }

  printBinary(num: num / 2)
  print(num % 2, terminator: "")
}

// 4. reverseLines
// print all lines in reverse order (recursively) from a atext file
func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/DKS/Downloads/provinces.txt", encoding: .utf8)
  let lines = contents.split(separator: "\n")
  
  if line > lines.count - 1 {
    return
  }
  
  reverseLines(line + 1)
  
  print(lines[line])

}


func evaluate(_ formula: String) -> Int {
  var trimedFormula = formula.trimmingCharacters(in: .whitespaces)
  
  if !formula.contains("(") {
    return Int(formula)!
  }
  
  let lastParenciesIndex = trimedFormula.lastIndex(of: "(")!

  var partString = (trimedFormula[trimedFormula.index(lastParenciesIndex, offsetBy: 1)...])
  let index = partString.firstIndex(of: ")")!
  partString = partString[partString.startIndex..<index]
  
  let expression = NSExpression(format: String(partString))
  if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
    if let range = formula.range(of: "(" + partString + ")") {
      trimedFormula.replaceSubrange(range, with: "\(result)")
    }
  }
  
  return evaluate(trimedFormula)
}
