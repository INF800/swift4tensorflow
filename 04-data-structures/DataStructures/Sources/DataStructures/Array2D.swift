public struct Array2D<T>{

  /*
  --------------------------------------------------------------
  In Swift we cannot declare a multidimensional array (2-D here)
  as in C or C++ or objective-C i.e
  `int array_2d[3][2]`
  
  Swift simply won't accept it but this struct implements that 
  2-D data-structure
  ---------------------------------------------------------------
  */
  
  //There are four different ways to initailize an
  // empty 2-D matrix =>
  // var array_2d : [[Int]] = []
  // var array_2d = [[Int]]()
  // var array_2d = Array<[Int]>()
  // var array_3d : Array<Array<Array<Any>>>()
  fileprivate var array_2d = Array<[T]>()
  public let COLS: Int 
  public let ROWS: Int
  public var INITIAL_VALUE_FOR_ALL: T 

  // We cannnot simply make an empty 2-D array. Some values must
  // be stored in each element. `INITIAL_VALUE_FOR_ALL` takes care 
  // of it.
  public init(rows: Int, cols: Int, initial_value_for_all: T){
    COLS = cols
    ROWS = rows
    INITIAL_VALUE_FOR_ALL = initial_value_for_all

    // CREATE 2-D ARRAY 
    // -----------------
    // An initalize elements with `initial_value_for_all` taken 
    // from user.
    // 1. Create each individual 1-D row separately
    // 2. Append all rows to empty initialized `array_2d`  
    for _ in 0..<ROWS{
      var row = Array<T>()
      for _ in 0..<COLS{
        row.append(INITIAL_VALUE_FOR_ALL)
      }
      array_2d.append(row)
    }

    show() //display after initialisation
    
  }

  // Constructor overloading for initalizing if user
  // already know elements
  // Note: It shoud be a Rectange or Square matrix
  public init(_ array: [[T]]){
    array_2d = array
    COLS = array_2d[0].count
    ROWS = array_2d.count
    INITIAL_VALUE_FOR_ALL = array_2d[0][0] //dummy

    show() // after init
  }
  /*
  ----------------------------------------------------------------------------
  You can do the same with smaller lines of code using - 
  array `repeat` function argument
  ```
  array = .init(repeating: initialValue, count: rows*columns)
  ```
  and give above 1-D array a structure using `subscripts` same as 
  below BUT with formula:
  ```
  get{
    return array[row*cols + col]
  }
  set{
    array[row*cols + col] = newValue
  }

  [Note: I will use this functionality for creating multidimentional(>=2) arrays]
  --------------------------------------------------------------------------------
  ```
  */
  
  // Display
  // Todo: Format the display
  public func show(){
    print("\n2D Array looks like this:\n")
    for i in 0..<ROWS{
        for j in 0..<COLS{
          print(array_2d[i][j], terminator: "\t")              
        }
        print("\n")          
    }
  }
  
  public var rows: Int{
    return ROWS
  }

  public var cols: Int{
    return COLS
  }

 // returnable of type `T`, and editable as well  
  public subscript(_ row: Int, _ col: Int) -> T{
    get {
        precondition(row<rows, "Row index \(row) out of Range: 0 to \(rows-1)")
        precondition(col<cols, "Column index \(col) out of Range: 0 to \(cols-1)")

        return array_2d[col][row]
    }
    set{
        precondition(row<rows, "Row index \(row) out of Range: 0 to \(rows-1)")
        precondition(col<cols, "Column index \(col) out of Range: 0 to \(cols-1)")

        array_2d[col][row] = newValue // note: `newValue`
    }
  }
  
}


/*

[EXAMPLES]
=========================================================================================

1. Initialize
--------------
var arr2d = Array2D<Int>(rows: 3, cols: 4, initial_value_for_all: 0)

// if user already knows elements
// Note: It should be a rectangle / square matrix
var arr2 = Array2D<String>(
    [
        ["a", "b", "c"],
        ["d", "e", "f"]
    ]
)
print(arr2.cols) // 3
print(arr2.rows) // 2

2. Display (single digit elemeents preferred)
----------------------------------------------
arr2d.show()

3. Edit/Access particular element
----------------------------------
arr2d[2, 1] = 9
print(arr2d[2, 1])
arr2d.show()

4. Todo: `print(arr2d[2])` 
------------------------------------------------------
print whole col or row or slice of an array

=============================================================================================
*/