//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

import Foundation

func smallestNumberDivisibleBy(_ first: Int, to last: Int) -> Decimal {
        
    let factors = Array(first...last).map { primeFactors(of: $0) }

    let uniqueFactors = Set(factors.flatMap { $0 }).sorted()
   
    var multipliers = [Int]()
    
    for int in uniqueFactors {
        var maxNumberOfOccurrences = 0
        for array in factors {
            let numberOfOccurrences = array.filter { $0 == int }.count
            if numberOfOccurrences > maxNumberOfOccurrences {
                maxNumberOfOccurrences = numberOfOccurrences
            }
        }
        multipliers.append(maxNumberOfOccurrences)
    }

    let resultArray = zip(uniqueFactors, multipliers).map { pow(Decimal($0.0), $0.1) }
    
    return resultArray.reduce(1, *)
}

func primeFactors(of number: Int) -> [Int] {

    var primeFactors = [Int]()

    var n = number
    
    // While n is divisible by 2, add 2 to factors and divide n by 2
    while n.isMultiple(of: 2) {
        primeFactors.append(2)
        n = n / 2
    }
    
    let sqrRoot = Int(Double(n).squareRoot())
    
    // For i between 3 and the square root of n
    // If n is divisible by i, add i to factors and divide by i
    if sqrRoot >= 3 {
        for i in 3...sqrRoot {
            if n % i == 0 {
                primeFactors.append(i)
                n = n / i
            }
        }
        
    }
    
    // If n is now > 2, add to factors
    if n > 2 {
        primeFactors.append(n)
    }

    return primeFactors

}

smallestNumberDivisibleBy(1, to: 20)
