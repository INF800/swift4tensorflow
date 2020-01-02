// Linked List Implementation
// ===========================

// [Performance:]
// --------------
// Most of it's operations are O(n) i.e
// Slower than arrays.
// But they are more flexible; Just change pointers
// to make changes.
// It is O(n) because,
// we cannot simply write LinkedList[i] to access
// ith element. We have to start right from `head`
// or 'tail' (if we dont have reference to it already).

// Note:
// But once you have a reference to a node, operations like
// insertion and deletion are really quick (of O(1) ).
// It's just that finding the node is slow.


// [Uses:]
// -------
// Just like Queue but more flexible.
// For example, if we need to remove elements from begining,
// n shifts have to be made unlike just changing the `head`
// in linked lists
// =================================================================
// ==================================================================



// Node: An individual data block of which the whole
// Linked list consist of.
// We have to use class as we will be needing references(i.e pointers)
// which isn't possible with structs.


public class LinkedListNode<T>{ // T can be any type of data this node will store
                                // but not `nil`
    var value: T // data to store. It cannot be nil. Hence `T` used instead of `T?`
    var next: LinkedListNode? // Next node pointer. Can be nil hence, `?`
    weak var previous: LinkedListNode? // `weak` to aviod ownership cycles
                                       // can we put `weak` to `next` instead of `previous`
    // constructor
    public init(value: T){ // Cannot be nil. hence, no `?`
        self.value = value
    }
}




// The Linked List. Let's build it using nodes
public class LinkedList<T>{
    public typealias Node = LinkedListNode<T>
    // Now, `Node?` means same as `LinkedListNode<T?>`
    
    // empty constructor
    public init(){ }
    
    // starting point. (private. Accessed using `first`)
    fileprivate var head: Node? // Can be empty i.e `nil`. Hence, `?`
    //fileprivate var tail: Node? <--------
    
    // ----------commons------------
    // store emptiness
    public var  isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? { // can be `nil` hence use `?`
        return head // reference to first node.
                    // can be used to fetch that node's data `value`
    }
    
    // public var last: Node? { <-----------
    //     return tail
    // }
}

