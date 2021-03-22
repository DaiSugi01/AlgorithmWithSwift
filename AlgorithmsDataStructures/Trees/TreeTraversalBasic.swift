//
//  Tree.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/16.
//

import Foundation

// Leet code often use this class
public final class TreeNode<T> {
  public var data: T
  public var left: TreeNode<T>?
  public var right: TreeNode<T>?

  public init(data: T) {
    self.data = data
  }
}

public func preOrder(_ rootNode: TreeNode<Int>?) {
  if rootNode == nil { return }

  print(" \(rootNode!.data) ->", terminator: "")
  preOrder(rootNode?.left)
  preOrder(rootNode?.right)
}

public func inOrder(_ rootNode: TreeNode<Int>?) {
  if rootNode == nil { return }

  preOrder(rootNode?.left)
  print(" \(rootNode!.data) ->", terminator: "")
  preOrder(rootNode?.right)
}

public func postOrder(_ rootNode: TreeNode<Int>?) {
  if rootNode == nil { return }

  preOrder(rootNode?.left)
  preOrder(rootNode?.right)
  print(" \(rootNode!.data) ->", terminator: "")
}
