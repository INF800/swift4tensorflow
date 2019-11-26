// Simple unoptimal implementation of Queue
// ------------------------------------------
// Implemented same as stack in `Stack.swift`
// but unlike it, this implementation has
// unoptimal dequeue operation

public struct SimpleQueue<T>{
  public var array = Array<T>()

  public init(elements: Array<T>){
    array = elements
  }

  public var isEmpty: Bool{
    return array.isEmpty
  }

  public mutating func enqueue(_ element: T){
    array.append(element)
  }

  public mutating func dequeue() -> T?{
    guard !isEmpty else{
      return nil
    }
    return array.removeFirst()
  }

  public var count: Int{
    return array.count
  }

  public var first: T?{
    return array.first
  }

  public var last: T?{
    return array.last
  }

  public func show(){
    print(array)
  }
}

