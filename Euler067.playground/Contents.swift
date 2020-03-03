//By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
//
//3
//7 4
//2 4 6
//8 5 9 3
//
//That is, 3 + 7 + 4 + 9 = 23.
//
//Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.
//
//NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)


//Note: to add file to playground:
//Select the . playground file.
//Open Utility inspector, In the playground press opt-cmd-1 to open the File Inspector. You should see the playground on the right. ...
//Under 'Resource Path' in Playground Settings choose 'Relative To Playground' and platform as OSX.
//import Foundation

var text = ""
do {
    guard let fileUrl = Bundle.main.url(forResource: "triangle", withExtension: "txt") else { fatalError() }
    text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
} catch {
    print(error)
}


let array = text.components(separatedBy: "\n").map {
    $0.components(separatedBy: " ")
}

var intArray = array.map {
    $0.compactMap { Int($0) }
}


intArray = intArray.filter { $0.count != 0 }


func max(input: [[Int]]) -> Int {
    
    var matrix = input
   
    for j in 2...input.count {
        
        let row = input.count - j
        
        var maximums = [Int]()
        
        for i in 0..<matrix[row].count {
            
            let maximum = max(
                matrix[row][i] + matrix[row+1][i],
                matrix[row][i] + matrix[row+1][i+1])
        
            maximums.append(maximum)
        }
        
        matrix[row] = maximums
        
        matrix = matrix.dropLast()
        
    }
    
    return matrix.first?.first ?? 0
    
}


print(max(input: intArray))
