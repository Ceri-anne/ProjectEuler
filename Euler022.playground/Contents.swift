//Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
//
//For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
//
//What is the total of all the name scores in the file?

import Foundation

var text = ""

func extractNameData() -> [String] {
    
    var results = [String]()
    
    guard let fileUrl = Bundle.main.url(forResource: "names", withExtension: "txt") else {
        fatalError(
            """
            Expected names.txt to exist in Resources.
            To add file to playground:
            1. Open the Utility Inspector (Option+Cmd+1)
            2. Drag file from Finder to Resources folder
            """)
    }
    
    guard let text = try? String(contentsOf: fileUrl, encoding: String.Encoding.utf8) else {
        fatalError("Expected data to be text")
    }
    
    results = text.replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")

    return results
}

func alphabeticScore(for string: String) -> Int {
    
    let array: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    let scores = string.lowercased().map {
        (array.firstIndex(of: $0) ?? -1 ) + 1
    }
    
    return scores.reduce(0, +)
}

func namesScores() -> Int {
    
    let names = extractNameData().sorted()
    
    let scores = names.enumerated().map { index, value in
        
        (index + 1) * alphabeticScore(for: value)
        
    }
    
    return scores.reduce(0, +)
    
}

namesScores()
