// Simple unoptimal implementation of Queue
// ------------------------------------------
// Implemented same as stack in `Stack.swift`
// but unlike it, this implementation has
// unoptimal dequeue operation.
// (See `Stack.swift` for detailed explanation
// of implementation)


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

// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------

// Optimal Queue

public struct Queue<T>{
  public var array = Array<T?>()
  var head: Int = 0

  public init(elements: Array<T>){
    array = elements
  }

  public init() {  
    // for empty Queue initialisation
  }

  public var count: Int{
    return array.count - head
  }

  public var isEmpty: Bool{
    return count==0
  }

  public func show(){
    print(array)
  }

  public mutating func enqueue(_ element: T){
    array.append(element)
  }

  public mutating func dequeue() -> T?{
    
    // without `&& head < array.count` no error 
    guard !isEmpty && head < array.count else{ return nil}

    let dequeuedElement = array[head]
    array[head] = nil
    head = head + 1

    let max_limit_without_trimming = 10
    let percent_of_nils = Double(head) / Double(array.count)
    
    if array.count > max_limit_without_trimming && percent_of_nils > 0.3 {
      array.removeFirst(head)
      head = 0
    }

    return dequeuedElement
  }
}


