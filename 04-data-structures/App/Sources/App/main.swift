import DataStructures

// 1. Initialisation
var dk = Deque(elements: [1, "a", 4, nil, "dont specify type if you wanna add 'nil'"]) // [1, "a", 4]
dk.show()
var emptyDk = Deque<Any>() // []
emptyDk.show()
var emptyIntDk = SimpleDeque<Int>() // []
emptyIntDk.show()

// 2. Commons
print(dk.count) // 3
print(dk.isEmpty) // false
var first = (dk.first ?? "stack is empty")!
print(first) // 1
var last = (dk.last ?? "stack is empty")!
print(last)// 4
dk.show() // [1, "a", 4]

// 3. regular enqueue, dequeue
dk.enqueue("added.")
dk.show() //[1, "a", 4, "added."]
var dequeued = (dk.dequeue() ?? "Deque is empty")!
print(dequeued)// 1
dk.show() // ["a", 4, "added."]


// 4. enqueueFront, dequeueBack
print("-------------------")
var a = Deque<Int>(elements: [1, 2, 3])
a.show()

a.enqueueFront(0)
a.show()

// test
print(a.count)

a.dequeueBack()
a.dequeueBack()
a.dequeueBack()
var removed = (a.dequeueBack())!
print(removed)
a.show()
print(a.count)
