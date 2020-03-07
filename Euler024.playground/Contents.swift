//A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
//
//012   021   102   120   201   210
//
//What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

func lexicographic(_ array: [Int], permutationNumber: Int) -> String {

    var array = [0,1,2,3,4,5,6,7,8,9]
    
    var result = Array(repeating: 0, count: array.count)
      
    var index: UInt64 = 0
    var r = (UInt64(permutationNumber) - 1)

    for i in 0..<array.count {
     
        (index, r) = r.quotientAndRemainder(dividingBy: factorial(array.count-1))

        let digit = array[Int(index)]
        result[i] = digit
      
        array = array.filter { $0 != digit }
    }
    
  
    return result.map { String($0) }.joined()
}

func factorial(_ n: Int) -> UInt64 {
    
    var result: UInt64 = 1
    
    if n <= 1 {
        return 1
    }
    
    for i in 1...n {
        result *= UInt64(i)
    }
    
    return result
}

print(lexicographic([1,2,3,4,5,6,7,8,9], permutationNumber: 1000000))
