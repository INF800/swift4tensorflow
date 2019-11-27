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
  
  public init(){ } 

  public var isEmpty: Bool{
    return array.isEmpty
  }

  // optimal: O(1) amortized (once in a while O(n))
  public mutating func enqueue(_ element: T){
    array.append(element)
  }

  // Unoptimal: O(n)
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
/*
Note:

The above queue will work completely fine but has unoptimal dequeue operation.
-------------------------------------------------------------------------------

[Enqueue:] It is optimal with amortized time complexity O(1) i.e once in a while,
it becomes O(n) but on average it is O(1).
There is already empty space present at rearer end of an `array`. So, while enquing, we are just 
copying element(s). Copy operation has time complexity O(1). 
But, when there is no empty space available at rearer end, extra space is allocated to the 
`array` which has geater time complexity O(n).

[Dequeue:] It is unoptimal in above case because, there is no space present at front end of `array`.
Whenever wee deque an element, all elements have to be `shifted` to left which has time complexity
of O(n)

[Solution:]To solve this, add empty space in front of `array` and trim it ocassionally.
It is like if in a supermarket the people in the checkout lane do not shuffle forward towards the 
cash register, but the cash register moves up the queue.

*/
// =====================================================================================================

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


