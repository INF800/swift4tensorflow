public struct Array2D<T>{
  
  //There are three different ways to initailize an
  // empty 2-D matrix
  // var array_2d : [[Int]] = []
  // var array_2d = [[Int]]()
  // var array_2d = Array<[Int]>() 
  fileprivate var array_2d = Array<[T]>()
  public let COLS: Int 
  public let ROWS: Int
  public let INITIAL_VALUE_FOR_ALL: T

  public init(rows: Int, cols: Int, initial_value_for_all: T){
    COLS = cols
    ROWS = rows
    INITIAL_VALUE_FOR_ALL = initial_value_for_all

    for _ in 0..<ROWS{
      var row = Array<T>()
      for _ in 0..<COLS{
        row.append(INITIAL_VALUE_FOR_ALL)
      }
      array_2d.append(row)
    }    
  }

  // format the display
  public func show(){
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

