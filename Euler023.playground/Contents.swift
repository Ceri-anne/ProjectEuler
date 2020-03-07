//A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
//
//A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
//
//As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
//
//Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

// Run from command line by running swift Contents.swift from playground folder

import Foundation

extension Int {
    
    enum PerfectStatus: Int {
        case perfect = 0
        case deficient = -1
        case abundant = 1
    }
        
    var perfectStatus: PerfectStatus {
        
        let divisorsSum = divisors().reduce(0, +)
        
        if divisorsSum > self {
            return PerfectStatus.init(rawValue: 1)!
        } else if divisorsSum < self {
            return PerfectStatus.init(rawValue: -1)!
        } else {
            return PerfectStatus.init(rawValue: 0)!
        }
    }
    
    func divisors() -> [Int] {
        
        var result = [1]
        
        guard self > 3 else {
            return result
        }
        
        let squareRoot = Int(Double(self).squareRoot())
        
        for i in 2...(squareRoot) {
            if self.isMultiple(of: i) {
                result.append(i)
                let m = self/i
                if m != i {
                    result.append(m)
                }
            }
        }
        
        return result
        
    }
}


func abundantNumbers(upTo n: Int) -> [Int] {
    return Array(1...n).filter { $0.perfectStatus == .abundant }
}


func cannotSumWithAbundantNumbers(upTo n: Int) -> Int {

    let startingPoint = Date()

    var count = 0

    let abundant = abundantNumbers(upTo: n)

    var isAbundantSum = Array(repeating: 0, count: n + 1)

    for i in abundant {

       for j in abundant {

            let sum = i+j
        
            if sum > n {
                break
            }

            if isAbundantSum[sum] == 0 {
                isAbundantSum[sum] = 1
            }

        }
    }

    for i in 1...n {
        if isAbundantSum[i] == 0 {
            count += i
        }
    }

    print("\(startingPoint.timeIntervalSinceNow * -1) seconds elapsed")

    return count
}


let result = cannotSumWithAbundantNumbers(upTo: 28123)

print(result)
