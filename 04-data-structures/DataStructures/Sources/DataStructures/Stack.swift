public struct Stack<T>{
  
  // Internal array over which we will wrap up Stack
  fileprivate var array = Array<T>()

  // Construct internal array with the values
  // provided by user
  // ---------------------------------------------------
  // Note: If user doesn't provide data-type explicitly
  // as in `Stack<Int>`, we can create stack of mixed 
  // data types as in example.
  public init(elements: Array<T>){
    self.array = elements
  }
  // For empty stack initialisation
  public init(){ }

  // Top element
  // -----------------------------------------------------
  // Exploits `.last` of an array. Should be of optional  
  // data-type as it `.last` may return `nil` if stack is 
  // empty. 
  // `??` operator must be used at user end to deal
  // with `Optional(a)` unwrapping and nil coalescing
  public var Top: T?{
    return array.last
  }

  // Emptiness
  // ----------------------------
  // true if emplty else, false
  var isEmpty: Bool{
    return array.isEmpty
  }

  // Display elements of the stack
  public func show(){
    print(array)
  }

  // Display number of elements
  // -----------------------------------------------
  // `Int` type as always an `Int` will be returned
  public var count: Int {
    return array.count
  }  

  // Push into stack
  // --------------------------------------------------------
  // `T` may become `Any` depending on what the user inputs
  public mutating func push( _ element: T){
    array.append(element)
  }

  // Remove from stack
  // ---------------------------------------------------------
  // `guard` is just another conditional like `if`
  // `Optional<Any>` will be returned as an output i.e
  // `Optional(a)` will be returned. 
  // This must be unwrapped
  // correctly at user end using `??` operator. It must also
  // be used for nil coalescing
  public mutating func pop() -> T?{
    guard !isEmpty else{
      return nil
    }
    return array.removeLast()
  }

}





/*
============================================================
[STACK EXAMPLES]
============================================================

1. Create a Stack of Any data-types
-----------------------------------------------------------
var myStack = Stack(elements: [7, "a"])

2. Create a Stack of fixed data-types
-----------------------------------------------------------
var myStack = Stack<Int>(elements: [7, 8])

3. Access Top Element
-----------------------------------------------------------
var topElement = myStack.Top ?? "Stack is Empty"
print(topElement)

Note: It may return `nil` or some `Optional`. So, to handle
`nil` and to unwrap optional effectively. Use this syntax 
at user-end.
a. Converts optional `st.Top` to it's data-type
b. Checks if stack is empy or not effectively

4. Check emptiness
-----------------------------------------------------------
myStack.isEmpty

5. Display stack
-----------------------------------------------------------
myStack.show()

6. Display number of Elements
-----------------------------------------------------------
myStack.count

7. Push into stack
-----------------------------------------------------------
myStack.push("hi")
myStack.push(5)

8. Remove from stack
------------------------------------------------------------
var poppedElement = st.pop() ?? "stack empty"
print(poppedElement)
st.show()

Note:
a. unwraps optional
b. checks if stack empty
c. guard in function definition is simply a conditional. It
has noth to do with `a` and `b` 



Note: 

a. All operations are same for `Stack<Any>` and `Stack<T>`
b. Simply use `print( myStack.pop() ?? "Stack is empty" )`

*/
