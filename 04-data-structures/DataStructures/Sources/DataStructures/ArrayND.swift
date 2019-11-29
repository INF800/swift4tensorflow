public let nd_arr = """
public struct ArrayND{
    
    static public func printme(){
        let array_nd = [
                [
                    [],
                    [],
                    []
                ],
                [
                    [],
                    [],
                    []
                ],
                [
                    [],
                    [],
                    []
                ]
            ]

        let arr = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    
        print(type(of: array_nd))
        print(type(of: arr))
        print(arr)
    }
    
    
}
"""