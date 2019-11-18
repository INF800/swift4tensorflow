public struct Stack<T>{

	// base datastucture
	fileprivate var array: [T] = []

	var isEmpty: Bool{
		return array.isEmpty
	}

	var count: Int{
		return array.count
	}

	public mutating func pop() -> T?{
		return array.popLast()
	}

	public mutating func push(_ element: T){
		array.append(element)
	}

	public func top() -> T?{
		return array.last
	}

}

//test
var st = Stack(array: [1,5,8,0])

print("Popping", st.pop())

print("Pushing 1")
st.push(1)

print("Top element: ", st.top())

print("is empty: ", st.isEmpty)

print("count", st.count)		
