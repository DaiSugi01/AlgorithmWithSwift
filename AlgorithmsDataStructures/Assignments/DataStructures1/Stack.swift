//
//  Stack.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/15.
//

import Foundation

public final class Stack<E>: Sequence {
  
  private(set) var count: Int = 0
  private var first: Node<E>? = nil

  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    init(item: E, next: Node<E>?) {
      self.item = item
      self.next = next
    }
  }
  
  init() {
  }
    
  public func push(item: E) {
    if first == nil {
      first = Node(item: item, next: nil)
      count += 1
      return
    }
    
    let newItem = Node(item: item, next: nil)
    let temp = first
    first = newItem
    newItem.next = temp
    count += 1
  }
  
  public func pop() -> E? {
    guard let firstNode = first else { return nil }
    
    let poppedNode = firstNode.item
    first = firstNode.next
    count -= 1
    return poppedNode
  }
  
  public func peek() -> E? {
    guard let firstNode = first else { return nil }
    
    return firstNode.item
  }

  public func isEmpty() -> Bool {
    return count == 0
  }

  public struct StackIterator<E>: IteratorProtocol {
    public typealias Element = E
    private var current: Node<E>?
    
    fileprivate init(_ first: Node<E>?) {
      self.current = first
    }
    
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        
        return item
      }
      
      return nil
    }
  }
  
  public func makeIterator() -> StackIterator<E> {
    return StackIterator<E>(first)
  }
}

extension Stack: CustomStringConvertible {
  public var description: String {
    return self.reduce(into: "") { $0 += "\($1), " }
  }
}
