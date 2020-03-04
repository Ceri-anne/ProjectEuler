////n! means n × (n − 1) × ... × 3 × 2 × 1
////
////For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
////and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
////
////Find the sum of the digits in the number 100!

func sumOfDigitalsFactorial(number: Int) -> Int {
    
    var array: [Int] = [1]
    
    for j in 1...number {
        
        array = array.map { $0 * j }
    
        for i in 0...array.count-1 {
            
            while array[i] > 9 {
                
                if array.last != 0 {
                    array.append(0)
                }
                
                array[i+1] += 1
                array[i] -= 10
                
            }
        }
        
    }
    
    return array.reduce(0, +)
    
}

sumOfDigitalsFactorial(number: 100)

