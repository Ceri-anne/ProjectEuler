////The following iterative sequence is defined for the set of positive integers:
////
////n → n/2 (n is even)
////n → 3n + 1 (n is odd)
////
////Using the rule above and starting with 13, we generate the following sequence:
////
////13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
////It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
////
////Which starting number, under one million, produces the longest chain?
////
////NOTE: Once the chain starts the terms are allowed to go above one million.
//

import Foundation

func nextItem(after n: Int64) -> Int64 {

    if n.isMultiple(of: 2) {
        return n/2
    }
    return (3 * n) + 1
}

func sequenceLengths(under n: Int64) -> [Int64: Int64] {

    var cache = [Int64: Int64]()

    for i in 1..<n {

        var count: Int64 = 1

        var m = i

        while m > 1 {

            let next = nextItem(after: m)
            m = next

            if cache.keys.contains(next) {
                if let length = cache[next] {
                    count += length
                }
                break
            }
          
            count += 1

        }
    
        cache[i] = count
    }

    return cache
}

func longestSequence(under n: Int64) -> Int64 {

    let lengths = sequenceLengths(under: n)
    let maximumSequenceLength = lengths.max { a, b in a.value < b.value }

    print(maximumSequenceLength)
    if let max = maximumSequenceLength {
        return max.key
    }

    return 1

}

let startingPoint = Date()

print(longestSequence(under: 1000000))

print("\(startingPoint.timeIntervalSinceNow * -1) seconds elapsed")
