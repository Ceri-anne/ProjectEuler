//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
//What is the 10 001st prime number?


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

func nthPrime(n: Int) -> Int {
    
    var primes = [2]
   
    var i = 3
    while primes.count < n {

        if i.isPrime {
            primes.append(i)
        }
        i += 2
    }
    
    return primes[n-1]
    
}

nthPrime(n: 10001)
