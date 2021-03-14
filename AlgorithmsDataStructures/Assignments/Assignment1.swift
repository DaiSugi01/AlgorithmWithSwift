//
//  Assignment1.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/10.
//

import Foundation

/**
 * 5.. evaluate
 * Write a recursive function evaluate that accepts a string
 * representing a math expression and computes its value.
 * - The expression will be "fully parenthesized" and will
 *     consist of + and * on single-digit integers only.
 * - You can use a helper function. (Do not change the original function header)
 * - Recursion
 *
 * evaluate("7")                            -->  7
 * evaluate("(2+2)")                      -->  4
 * evaluate("(1+(2*4))")                -->  9
 *
 * evaluate("((1+3)+((1+2)*5))")  ->  19
 */
func evaluate(_ formula: String) -> Int {
  var trimedFormula = formula.trimmingCharacters(in: .whitespaces)
  
  if !trimedFormula.contains("(") {
    return Int(trimedFormula)!
  }
  
  let openingBracketIndex = trimedFormula.lastIndex(of: "(")!
  var extractString = (trimedFormula[trimedFormula.index(openingBracketIndex, offsetBy: 1)...])
  let closingBracketIndex = extractString.firstIndex(of: ")")!
  extractString = extractString[extractString.startIndex..<closingBracketIndex]
  
  let expression = NSExpression(format: String(extractString))
  if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
    if let range = trimedFormula.range(of: "(\(extractString))") {
      trimedFormula.replaceSubrange(range, with: "\(result)")
    }
  }
  
  return evaluate(trimedFormula)
}
