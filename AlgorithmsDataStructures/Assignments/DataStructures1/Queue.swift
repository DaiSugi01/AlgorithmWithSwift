//
//  Queue.swift
//  AlgorithmsDataStructures
//
//  Created by 杉原大貴 on 2021/03/15.
//

import Foundation

public final class Queue<E>: Sequence {
  
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
    
  public func enqueue(item: E) {
    let newNode = Node(item: item, next: nil)
    if first == nil {
      first = newNode
      count += 1
      return
    }
   
    var prevNode = first
    var current = first?.next
    
    while current != nil {
      prevNode = current!
      current = current?.next
    }
    prevNode?.next = newNode
    count += 1
  }
  
  public func dequeue() -> E? {
    guard let firstNode = first else { return nil }
    
    let item = firstNode.item
    first = first?.next
    
    count -= 1
    return item
  }
  
  public func peek() -> E? {
    guard let firstNode = first else { return nil }
    
    var prevNode = firstNode
    var current = prevNode.next

    while current != nil {
      prevNode = current!
      current = current?.next
    }
    
    return prevNode.item
  }

  public func isEmpty() -> Bool {
    return count == 0
  }
  
  public struct QueueIterator<E>: IteratorProtocol {
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
  
  public func makeIterator() -> QueueIterator<E> {
    return QueueIterator<E>(first)
  }
}

extension Queue: CustomStringConvertible {
  public var description: String {
    return self.reduce(into: "") { $0 += "\($1), " }
  }
}
