////2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
////
////What is the sum of the digits of the number 2^1000?
////

import Foundation

func sumDigits(n: Int) -> Int {

    var array = [0, 2]

    for i in 1..<n {

        if array[0] != 0 || array[1] != 0 {
            array.insert(0, at: 0)
            array.insert(0, at: 0)
        }

        let doubles = array.map { $0 * 2 }
        
        var carry = Array.init(repeating: 0, count: array.count)

        for j in 0..<doubles.count {

            let index = doubles.count - 1 - j

            guard index >= 0  && index <= doubles.count-1 else {
                print("index out of range index: \(index)")
                break
            }

            guard index >= 0  && index <= array.count-1 else {
                print("index out of range index: \(index)")
                break
            }
            
            let double = doubles[index]
            if double >= 10 {
                array[index] = (double - 10)
                
                guard (index-1) >= 0  && (index-1) <= array.count-1 else {
                    print("index out of range index minus 1: \(index-1)")
                    break
                }
                
                carry[index-1] = 1
            } else {
                array[index] = double
            }
        }

        array = zip(array, carry).map() {$0 + $1}

        for i in 0..<array.count {
            if array[i] >= 10 {
                array[i] -= 10
                array[i-1] += 1
            }
        }

    }

    return array.reduce(0,+)
}

print(sumDigits(n: 1000))

