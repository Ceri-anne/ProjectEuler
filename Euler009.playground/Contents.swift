//A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
//a2 + b2 = c2
//For example, 32 + 42 = 9 + 16 = 25 = 52.
//
//There exists exactly one Pythagorean triplet for which a + b + c = 1000.
//Find the product abc.

func triplet(sum n: Int) -> Int {
    
    for a in 1...n/3 {
    
        print(a)
        for b in 1...n/2 {
        
           let c = n - a - b
                                
                if (a * a + b * b) == (c * c) {
                    if (a + b + c) == n {
                        return a * b * c
                    }
                }
        }
    }

    return 0
}

triplet(sum: 1000)
