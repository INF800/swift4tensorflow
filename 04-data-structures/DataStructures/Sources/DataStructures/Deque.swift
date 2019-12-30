// Double ended queue. "Deck"
public struct SimpleDeque<T>{
    // base
    fileprivate var array = Array<T>()
    
    // Construct internal array with the values
    // provided by user
    // ---------------------------------------------------
    // Note: If user doesn't provide data-type explicitly
    // as in `Stack<Int>`, we can create stack of mixed
    public init(elements: Array<T>){
        self.array = elements
    }
    
    // For empty Deque
    public init() {}
    
    // basic elements and methods
    public var first: T?{
        guard !isEmpty else {return nil}
        
        return array.first
    }
    
    public var last: T?{
        return array.last //or return array[array.count - 1]
                          // -1 for out of index error
    }
    
    public var count: Int{
        return array.count
    }
    
    public var isEmpty: Bool{
        return array.isEmpty
    }
    
    public func show(){
        print(array)
    }
    
    // Optimal: O(1) amortized (once in a while O(n))
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    // Unoptimal: O(n) (because of 'n' shifts)
    public mutating func dequeue() -> T?{
        guard !isEmpty else {return nil}
        
        return array.removeFirst()
    }
    
    // Unoptimal: O(n) (because of 'n' shifts)
    public mutating func enqueueFront(_ element: T){
        array.insert(element, at: 0)
    }
    
    // Optimal: O(n) (no shifts to perform, memory is reaerved automatically)
    public mutating func dequeueBack() -> T?{
        guard !isEmpty else {return nil}
        
        return array.removeLast()
    }
}

/////////////////////////////////////////////////////////[EXAMPLES]//////////////////////////////////////////////////////////////////////////////////////////////////////////////
public var SimpleDequeExample = """
import DataStructures

// 1. Initialisation
var dk = SimpleDeque(elements: [1, "a", 4]) // [1, "a", 4]
dk.show()
var emptyDk = SimpleDeque<Any>() // []
emptyDk.show()
var emptyIntDk = SimpleDeque<Int>() // []
emptyIntDk.show()

// 2. Commons
print(dk.count) // 3
print(dk.isEmpty) // false
print(dk.first ?? "stack is empty") // 1
print(dk.last ?? "stack is empty") // 4
dk.show() // [1, "a", 4]

// 3. regular enqueue, dequeue
dk.enqueue("added.")
dk.show() //[1, "a", 4, "added."]
print(dk.dequeue() ?? "Deque is empty") // 1
dk.show() // ["a", 4, "added."]

// 4. enqueueFront, dequeueBack
dk.enqueueFront("added to front")
dk.show() // ["added to front", "a", 4, "added."]
print(dk.dequeueBack() ?? "Deque is empty") // added.
dk.show() // ["added to front", "a", 4]
print(emptyDk.dequeueBack() ?? "Deque is empty") // Deque is empty
emptyDk.show() // []

"""
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// OPTIMAL IMPLEMENTATION
// -----------------------
// The reason that dequeue() and enqueueFront() are O(n)
// is that they work on the front of the array. If you remove an element
// at the front of an array, what happens is that all the remaining elements
// need to be shifted in memory.

// SOLUTION: Simply move the counter instead of moving people in the line
// As a result, free memory will be avl. at the front end of the array
// just like in rearer end!

public struct Deque<T>{
    fileprivate var array = Array<T?>() // `T?` because it can hold ONLY nils as well
    fileprivate var head: Int = 0
    
    // constructor
    public init() {}
    
    public init(elements: Array<T>){ // Note: as `T?` is used for initialisation, nils
                                     // wont be
                                     // added. If you want to add, just don't
                                     // specify type in <>:
                                     // var dk = Deque(elements: ["a", nil, "b"])
                                     // Note: You may end up with Optional(Optional("a"))
                                     // even so, if nil is present in data, you may end
                                     // up with problems as `nil` is used in deque condition. So adding nils in data is not
                                     // a good practice
        self.array = elements
    }
    
    // commons
    public func show(){
        print(array)
    }
    
    public var count: Int{
        return array.count - head // Note: `- head` as there will be nils before head
    }
    
    public var first: T?{
        guard !isEmpty && head<array.count else {return nil}
        return array[head]
    }
    
    public var last: T?{
        guard !isEmpty && head<array.count else {return nil} // use this condition if `array.last` isn't used
        return array[array.count - 1] // or array.last
    }
    
    public var isEmpty: Bool{
        return count == 0
    }
    
    // regular enqueue, dequeue
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    public mutating func dequeue() -> T?{
        guard !isEmpty && head < array.count else {return nil}
        
        // dequeue
        // -------
        let dequeued = array[head] //or array.first
        array[head] = nil
        head = head + 1
        
        // trim
        // --------
        let max_limit_for_base_array_without_trimming = 100
        let max_percent_of_nils_allowed = 0.3
        //calculate current
        let current_percent_of_nils = Double(head) / Double(array.count)
        
        if array.count > max_limit_for_base_array_without_trimming && current_percent_of_nils < max_percent_of_nils_allowed {
            // `removeFirst(x)`
            // trims elements upto index `x`
            // from begining of `array`
            array.removeFirst(head)
            head = 0 // reinitalize, as array resized
        }
        
        return dequeued
    }
    
    // enqueueFront, dequeueBack
    public mutating func dequeueBack() -> T? {
        return array.removeLast() // no need to guard !isEmpty as builtin method `removeLast()` is used
    }
    
    public mutating func lessOptimalEnqueueFront(_ element: T){
        
        // As there will be no space at begining of array for adding elements,
        // we have to create space.
        // There is no need to create space if we already performed `dequeue`
        // operation as `nil`(s) will be present in front because of `dequeue`
        // head is not equal to 0 if we already performed `dequeue` operation
        // i.e there is no space in front if head = 0
        
        // create space
        //-------------
        // check if space available in front.
        // 0  means no space
        if head == 0 {
            // insert 3 nils space in front of array
            array.insert(contentsOf:[nil, nil, nil], at: 0)
            // head's posiion points at first element of our array when head = 0
            // but when we added 3 extra nils in front, head is pointing at nil when head = 0
            // so, change it to where it should be i.e head = num_of_nils_added
            // +1 because we start with 0
            head = 3
        }
        
        // enqueueFront
        // ------------
        // update head (decrement)
        head = head - 1
        array[head] = element // replace nil with value to front-enqueue
    }
    
    // More optimal
    // ------------
    var num_of_nils = 2 // amout of space to be allocated
    public mutating func enqueueFront(_ element: T){
        
        // create space
        //-------------
        if head == 0{
            // whenever new space has to be added AGAIN,
            // double the space of previously allocated space is added.
            // So, that space allocation task can be minimized as much as possible
            num_of_nils = num_of_nils * 2
            
            let empty_space_array_consisting_of_nils = Array<T?>(repeating: nil, count: num_of_nils)
            array.insert(contentsOf: empty_space_array_consisting_of_nils, at: 0)
            
            // change head to actual position
            head = num_of_nils // as we start with zero no +1 required
        }
        
        // insert element
        // --------------
        head = head - 1 // update
        array[head] = element // replace nil
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////[EXAMPLES]////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public var DequeExample = """
import DataStructures

// 1. Initialisation
var dk = Deque(elements: [1, "a", 4, nil, "dont specify type if you wanna add 'nil'"])
dk.show() // Optional(Optional(1)), Optional(Optional("a")), Optional(Optional(4)), nil, Optional(Optional("dont specify type if you wanna add \'nil\'"))]
var emptyDk = Deque<Any>()
emptyDk.show() // []
var emptyIntDk = SimpleDeque<Int>()
emptyIntDk.show() // []

// 2. Commons
print(dk.count) // 5
print(dk.isEmpty) // false
var first = (dk.first ?? "stack is empty")!
print(first) // 1
var last = (dk.last ?? "stack is empty")!
print(last)// dont specify type if you wanna add 'nil'
dk.show() // [Optional(Optional(1)), Optional(Optional("a")), Optional(Optional(4)), nil, Optional(Optional("dont specify type if you wanna add \'nil\'"))]

// 3. regular enqueue, dequeue
dk.enqueue("added.")
dk.show() // [Optional(Optional(1)), Optional(Optional("a")), Optional(Optional(4)), nil, Optional(Optional("dont specify type if you wanna add \'nil\'")), Optional(Optional("added."))]
var dequeued = (dk.dequeue() ?? "Deque is empty")!
print(dequeued)// 1
dk.show() // [nil, Optional(Optional("a")), Optional(Optional(4)), nil, Optional(Optional("dont specify type if you wanna add \'nil\'")), Optional(Optional("added."))]


// 4. enqueueFront, dequeueBack
print("-------------------")
var a = Deque<Int>(elements: [1, 2, 3])
a.show() // [Optional(1), Optional(2), Optional(3)]

a.enqueueFront(0)
a.show() // [nil, nil, nil, Optional(0), Optional(1), Optional(2), Optional(3)]

// test
print(a.count) // 4

a.dequeueBack()
a.dequeueBack()
a.dequeueBack()
var removed = (a.dequeueBack())!
print(removed) // 0 (Note: 0 when empty)
a.show() // [nil, nil, nil]
print(a.count) // 0
"""
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



