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
    // `array.last` instead produce error
    // Note: `-1` otherwise array out of range errpr
    return array[array.count - 1] 
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
  
  // Note:
  // Array must be of type optional as it stores `nil` aswell
  // Queue<T> not Queue<T?>
  public var array = Array<T?>()
  var head: Int = 0

  public init(elements: Array<T>){
    array = elements
  }

  public init() {  
    // for empty Queue initialisation
  }

  // As head will be increasing and `nil`s will be present in array,
  // best way to return count is `array.count - head`
  public var count: Int{
    return array.count - head
  }

  // As queue will never be empty because of `nil`s, 
  // to check if it is empty or not
  // we have to check if `head == array.count`
  // Note: `head` can become greater than `array.count`
  // which can be stopped by using conditional in dequeue operation.
  public var isEmpty: Bool{
    return count==0
  }
  
  public var first: T?{
    return array[head]
  }

  public var last: T?{
    // `array.last` instead produce error
    // Note: `-1` otherwise array out of range errpr
    return array[array.count - 1] 
  }

  public func show(){
    print(array)
  }

   // self-optimized
  public mutating func enqueue(_ element: T){
    array.append(element)
  }

  // Most of optimizatoin happens here
  // -----------------------------------------------------------
  // 1. Return `nil` if `queue` is empty
  // 2. Store dequeued element to return
  // 3. Assign `nil` to current front element and increnment `head`
  // 4. Trim `nil`s if size of `array` exceeds `max_limit_without_trimming` AND 
  // `percent_of_nils` in `array` exeeds `max_percent_of_nils`.
  public mutating func dequeue() -> T?{
    
    // without `&& head < array.count` there is no error 
    guard !isEmpty && head < array.count else{ return nil}

    let dequeuedElement = array[head] // For returning
    array[head] = nil
    head = head + 1

    // change these according to your neeeds
    let max_limit_without_trimming = 100
    let max_percent_of_nils = 0.3
    
    // As `head`<`array.count`, can calculate number of nils using this:
    let percent_of_nils = Double(head) / Double(array.count)
    
    if array.count > max_limit_without_trimming && percent_of_nils > max_percent_of_nils {
      array.removeFirst(head) // `removeFirst(x)` trims elements upto index `x` from begining of `array`
      head = 0 // reinitalize, as array resized
    }

    return dequeuedElement
  }
}


/*
Examples
-------------------------------------------------------------------------------------------------

1. Initialisation
------------------
var empty_int_qeue = Queue<Int>()
var empty_qeue_with_any_data_type = Queue<Any>()
var myQ = Queue(elements: [1, 3, 4, "r", 5])

2. Commons
-------------
print(myQ.count)
print(myQ.isEmpty)
print(myQ.first ?? "stack is empty")
print(myQ.last ?? "stack is empty")
myQ.show()

3. Dequeue
-----------
myQ.dequeue()
myQ.show()

4. Enqueue
-----------
myQ.enqueue("8")
myQ.show()

*/
