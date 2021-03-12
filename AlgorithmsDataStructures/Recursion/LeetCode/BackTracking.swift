//
//  BackTracking.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/11.
//

import Foundation

/*
 * 1641. Count Sorted Vowel Strings
 *
 * Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.
 * A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.
 *
 * Example 1:
 *    Input: n = 1
 *    Output: 5
 *    Explanation: The 5 sorted strings that consist of vowels only are ["a","e","i","o","u"].
 *
 * Example 2:
 *    Input: n = 2
 *    Output: 15
 *    Explanation: The 5 sorted strings that consist of vowels only are
 *                  ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"].
 *                  Note that "ea" is not a valid string since 'e' comes after 'a' in the alphabet.
 */
func countVowelStrings(_ n: Int) -> Int {
  var set = Set<String>()
  return countVowelStringsHelper(n, "", &set)
}

func countVowelStringsHelper(_ n: Int, _ soFar: String = "", _ set: inout Set<String>) -> Int {
  let vowels = ["a", "e", "i", "o", "u"]
  if n == 0 {
    let sortedSoFar = soFar.sorted()
    if !set.contains(String(sortedSoFar)) {
      set.insert(soFar)
      print(soFar)
    }
  } else {
    for i in 0 ... vowels.count - 1 {
      _ = countVowelStringsHelper(n - 1, soFar + vowels[i], &set)
    }
  }
  return set.count
}
