public struct Stack<T> {
  public var array = [T]()

  public mutating func create(_ arr: Array<T>) {                                                                                
    array = arr
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var top: T? {
    return array.last
  }
}
