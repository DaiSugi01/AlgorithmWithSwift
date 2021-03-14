//
//  Assignment2(mini1).swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/11.
//

import Foundation

struct Symbol {
  static let indent = "   "
  static let verticalBar = "│"
  static let cornerBar = "└── "
  static let horizontalBar = "── "
}

var fileCount = 0
var directoryCount = 0
let fileManager = FileManager.default

func crawl() {
  let filePath = fileManager.currentDirectoryPath
  let slashLastIndex = filePath.lastIndex(of: "/")!
  let fileName = "\(filePath[filePath.index(slashLastIndex, offsetBy: 1)...])"

  crawlHelper(filePath: filePath, fileName: fileName, soFarIndent: "")
  
  print("\n😽😽😽 \(directoryCount) directories, \(fileCount) files 😽😽😽")
}

func crawlHelper(filePath: String, fileName: String = "", soFarIndent: String, isLastFile: Bool = true ) {
  guard let contents = try? fileManager.contentsOfDirectory(atPath: filePath) else {
    fileCount += 1
    print("\(soFarIndent)\(isLastFile ? Symbol.cornerBar : Symbol.horizontalBar)\(fileName)")
    return
  }

  print("\(soFarIndent)\(isLastFile ? Symbol.cornerBar : Symbol.horizontalBar)\(fileName)")
  directoryCount += 1

  for content in contents {
    let isLast = (content == contents.last)
    let bar = isLast ? "" : Symbol.verticalBar
    crawlHelper(filePath: "\(filePath)/\(content)",
                  fileName: content,
                  soFarIndent: soFarIndent + Symbol.indent + bar,
                  isLastFile: isLast)
  }
}
