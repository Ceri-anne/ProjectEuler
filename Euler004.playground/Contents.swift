//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//
//Find the largest palindrome made from the product of two 3-digit numbers.

import Foundation

func largestPalindrome(numberOfDigits: Int) -> Int {
    
    let s = String(repeating: "9", count: numberOfDigits)
    
    let n = Int(s) ?? 1
    
    var palindromes = [Int]()
    
    for i in 0..<n {

        for j in 0...i {
            var product = (n - i) * (n - j)
            if product.isPalindrome {
                palindromes.append(product)
            }
        }

    }
    
    return palindromes.max() ?? 1
}

extension Int {
    var isPalindrome: Bool {
        let middle = Int(self/2)
        return String(self).prefix(middle) == String(String(self).suffix(middle).reversed())
    }
}

largestPalindrome(numberOfDigits: 3)
