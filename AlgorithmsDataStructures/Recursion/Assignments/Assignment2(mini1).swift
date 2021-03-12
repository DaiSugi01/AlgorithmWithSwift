//
//  Assignment2(mini1).swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/11.
//

import Foundation
//  1. to print all directories and files in your file system (current location).
//let fileManager = FileManager.default
//// - get the current location (path)
//// -
//
//fileManager.contentsOfDirectory(at: URL(string: fileManager.currentDirectoryPath),
//                                includingPropertiesForKeys: <#T##[URLResourceKey]?#>,
//                                options: <#T##FileManager.DirectoryEnumerationOptions#>)

var count = 0

func crawl() -> Void {
  let fileManager = FileManager.default
  print(fileManager.currentDirectoryPath)
}
