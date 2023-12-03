struct Day01: AdventDay {
    var data: String
    
    var lines: [String] {
        data.components(separatedBy: "\n").filter { !$0.isEmpty }
    }
    
    func part1() -> Any {
        var numbers: [Int] = []
        
        for line in lines {
            var numberInLine = String()
            
            for character in line {
                if character.isNumber && character.isASCII {
                    numberInLine.append(character)
                    break
                }
            }
            for character in line.reversed() {
                if character.isNumber && character.isASCII {
                    numberInLine.append(character)
                    break
                }
            }
            
            guard let intNumber = Int(numberInLine) else {
                return -1
            }
            
            numbers.append(intNumber)
        }
        
        return numbers.reduce(0, +)
    }
    
    func part2() -> Any {
        var numbers: [Int] = []
        
        for line in lines {
            var numberInLine = String()
            
            let digitsFound = findAllMatches(for: "[0-9]|one|two|three|four|five|six|seven|eight|nine", in: line)
            if let firstDigit = convertSpelledDigitToNumeric(string: digitsFound[0]) {
                numberInLine.append(firstDigit)
            } else {
                numberInLine.append(digitsFound[0])
            }
            if let secondDigit = convertSpelledDigitToNumeric(string: digitsFound[digitsFound.count - 1]) {
                numberInLine.append(secondDigit)
            } else {
                numberInLine.append(digitsFound[digitsFound.count - 1])
            }
            guard let intNumber = Int(numberInLine) else {
                return -1
            }
            
            numbers.append(intNumber)
        }
        
        return numbers.reduce(0, +)
    }
    
    func convertSpelledDigitToNumeric(string: String) -> Character? {
        if string.count == 1 {
            return Character(string)
        }
        
        switch string {
        case "zero": return "0"
        case "one": return "1"
        case "two": return "2"
        case "three": return "3"
        case "four": return "4"
        case "five": return "5"
        case "six": return "6"
        case "seven": return "7"
        case "eight": return "8"
        case "nine": return "9"
        default: return nil
        }
    }
    
    func findAllMatches(for regex: String, in text: String) -> [String] {
        var result = [String]()
        var startIndex = text.startIndex
        let endIndex = text.endIndex
        
        while let range = text.range(of: regex, options: .regularExpression, range: startIndex ..< endIndex) {
            result.append(String(text[range]))
            startIndex = text.index(after: range.lowerBound)
        }
        return result
    }
}
