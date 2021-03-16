//
//  Stack.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/15.
//

import Foundation

public final class Stack<E> {
  
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
    if let first = first {
      
      var prevNode = first
      var current = first.next
      
      while current != nil {
        prevNode = current!
        current = current?.next
      }
      prevNode.next = Node(item: item, next: nil)
    } else {
      first = Node(item: item, next: nil)
    }
    count += 1
  }
  
  public func pop() -> E? {
    guard let firstNode = first else { return nil }
    
    var prevNode = firstNode
    var current = prevNode.next

    if current == nil {
      let popedItem = firstNode.item
      first = nil
      count -= 1
      return popedItem
    }
    
    while current?.next != nil {
      prevNode = current!
      current = current?.next
    }
    
    prevNode.next = nil
    count -= 1
    return current!.item
  }
  
  public func peek() -> E? {
    guard let firstNode = first else { return nil }
    
    var prevNode = firstNode
    var current = prevNode.next

    if current == nil {
      let popedItem = firstNode.item
      first = nil
      count -= 1
      return popedItem
    }
    
    while current?.next != nil {
      prevNode = current!
      current = current?.next
    }
    
    return current!.item
  }

  public func isEmpty() -> Bool {
    return count == 0
  }

//  public struct StackIterator<E>: IteratorProtocol {
//    public
//    public func next() -> Element? {
//    }
//  }
}

//extension Stack: IteratorProtocol {
//  public typealias Element = E
//  public func next() -> E? {
//    return nil
//  }
//
//  public func makeIterator() -> Stack<E> {
//  }
//}
