//If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
//If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
//
//
//NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.


func units(n: Int) -> String {
    
    assert(n >= 0 && n < 10, "Error: n must be between 0 and 10 (inclusive)")
    
    let unitsArray = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    return unitsArray[n]
    
}

func teens(n: Int) -> String {
    
    assert(n >= 10 && n < 20, "Error: n must be between 10 and 19 (inclusive)")

    let teensArray = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  
    return teensArray[n-10]
}

func tens(n: Int) -> String {
    
    assert(n >= 20 && n < 100, "Error: n must be between 20 and 99 (inclusive)")

    let tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    let (q, r) = n.quotientAndRemainder(dividingBy: 10)
    
    var result = tens[q-2]
    
    if r != 0 {
        result += units(n: r)
    }
    
    return result

}

func hundreds(n: Int) -> String {
    
    assert(n >= 100 && n < 1000, "Error: n must be between 100 and 999 (inclusive)")
    
    var result = ""
    
    // Hundreds
    let (q, r) = n.quotientAndRemainder(dividingBy: 100)
    
    result += units(n: q) + "hundred"
    
    if r == 0 {
        return result
    }
    
    // Tens
    let remaining = n - ( q * 100 )
    
    result += "and"
    
    if remaining >= 20 {
        result += tens(n: remaining)
    }
    
    if remaining < 20 && remaining >= 10 {
        result += teens(n: remaining)
    }
    
    if remaining < 10 {
        result += units(n: remaining)
    }
    
    return result
    
}

func string(for n: Int) -> String {
    
    assert(n >= 0 && n <= 1000 , "Error: n must be between 0 and 1000 (inclusive)")
    
    if n < 10 {
        return units(n: n)
    } else if n < 20 {
        return teens(n: n)
    } else if n < 100 {
        return tens(n: n)
    } else if n < 1000 {
        return hundreds(n: n)
    } else {
        return "onethousand"
    }

}

func numberOfLetters(for n: Int) -> Int {
    return string(for: n).count
}

func totalNumberOfLetters(upto n: Int) -> Int {

    let array = Array(1...n)

    let counts = array.map {
        numberOfLetters(for: $0)
    }

    return counts.reduce(0, +)
}

totalNumberOfLetters(upto: 1000)
