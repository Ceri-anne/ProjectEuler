//Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
//If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
//
//For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
//
//Evaluate the sum of all the amicable numbers under 10000.

func divisorsOf(n: Int) -> [Int] {
    
    var result = [1]
    
    guard n > 3 else {
        return result
    }
    
    let squareRoot = Int(Double(n).squareRoot())
    
    if n.isMultiple(of: squareRoot) {
        result.append(squareRoot)
    }
    
    for i in 2..<squareRoot {
        if n.isMultiple(of: i) {
            result.append(i)
            result.append(n/i)
        }
    }
    
    return result
    
}

func amicableNumbers(a: Int, b: Int) -> Bool {
    return divisorsOf(n: a).reduce(0, +) == b
        && divisorsOf(n: b).reduce(0, +) == a
}

func amicableNumbersUnder(n: Int) -> Int {
    
    var amicableNumbers = [Int]()
    var factorSums = [Int]()

    for i in 1..<n {
        
        let sum = divisorsOf(n: i).reduce(0, +)
        factorSums.append(sum)
                
        if (sum-1) < i && sum != i {
            
            if factorSums[sum-1] == i {
                amicableNumbers.append(sum)
                amicableNumbers.append(i)
            }
            
        }
    
    }
    
    return amicableNumbers.reduce(0, +)
}

print(amicableNumbersUnder(n: 10000))

