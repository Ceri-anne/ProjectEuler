//Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
//How many such routes are there through a 20×20 grid?

import Foundation

func routes(n: Int) -> Int {

    let numberOfSteps = n + n

    var paths = 1
    
    for i in 1...n {
        paths *= (i+n)
        paths /= i
    }
    
    return paths
}

routes(n: 20)

//paths   = 40! / (20!20!)
//        = (40*39*...*3*2*1) / ((20*19*...*3*2*1) * (20*19*...*3*2*1))
//        = (40*39*...*22*21) / (20*19*...*3*2*1)

