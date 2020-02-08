//
//The sum of the squares of the first ten natural numbers is,
//
//1^2+2^2+...+10^2=385
//The square of the sum of the first ten natural numbers is,
//
//(1+2+...+10)^2=55^2=3025
//Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025−385=2640.
//
//Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

import Foundation

func sumOfSquares(upto n: Int) -> Decimal {
    let squares = Array(1...n).map { pow(Decimal($0),2) }
    
    return squares.reduce(0,+)
}

func squareOfSum(upto n: Int) -> Decimal {
    
    let sum = Array(1...n).reduce(0,+)
    
    return pow(Decimal(sum), 2)
    
}

func euler(upto n: Int) -> Decimal {
    
    return squareOfSum(upto: n) - sumOfSquares(upto: n)
    
}

euler(upto: 100)
