import Foundation
//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?

func largestPrimeFactor(for number: Int) -> Int {
    
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
    
    guard let largestPrimeFactor = primeFactors.max() else {
        print("Error: Prime Factors is Empty!")
        return 0
    }
    
    return largestPrimeFactor
}

largestPrimeFactor(for: 600851475143)
