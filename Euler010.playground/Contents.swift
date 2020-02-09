//The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
//Find the sum of all the primes below two million.


func sumOfPrimes(upTo n: Int) -> Int {
    
    let numbers = Array(2...n)
    
    let primes = numbers.filter { $0.isPrime }

    return primes.reduce(0,+)
}

extension Int {
    var isPrime: Bool {
        
        if self == 2 {
            return true
        }
        
        if self.isMultiple(of: 2) {
            return false
        }
        
        let sqrRoot = Int(Double(self).squareRoot())
        
        // For i between 3 and the square root of n
        // If n is divisible by i, add i to factors and divide by i
        if sqrRoot >= 3 {
            for i in 3...sqrRoot {
                if self % i == 0 {
                    return false
                }
            }
        }
        return true
    }
}


let result = sumOfPrimes(upTo: 2000000)
print(result)
