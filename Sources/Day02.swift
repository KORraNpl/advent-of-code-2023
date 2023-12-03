struct Day02: AdventDay {
    var data: String
    
    var lines: [String] {
        data.components(separatedBy: "\n").filter { !$0.isEmpty }
    }
        
        func part1() -> Any {
            var result = 0
            let availableCubes = [
                "red": 12,
                "green": 13,
                "blue": 14,
            ]
            
            for line in lines {
                var isValidGame = true
                guard let gameNumber = Int(line.components(separatedBy: ": ").first?.components(separatedBy: " ")[1] ?? "") else {
                    return -1
                }
                guard let draws = line.components(separatedBy: ": ").last?.components(separatedBy: "; ") else {
                    return -1
                }
            drawLoop: for draw in draws {
                for singleColorCubes in draw.components(separatedBy: ", ") {
                    guard let amount = Int(singleColorCubes.components(separatedBy: " ")[0]) else {
                        return -1
                    }
                    let color = singleColorCubes.components(separatedBy: " ")[1]
                    if amount > availableCubes[color] ?? 0 {
                        isValidGame = false
                        break drawLoop
                    }
                }
            }
                if isValidGame {
                    result += gameNumber
                }
            }
                return result
        }
    
    func part2() -> Any {
        var result = 0
        var currentGameMin = [
            "red": 0,
            "green": 0,
            "blue": 0,
        ]
        
        for line in lines {
            currentGameMin = [
                "red": 0,
                "green": 0,
                "blue": 0,
            ]
            guard let draws = line.components(separatedBy: ": ").last?.components(separatedBy: "; ") else {
                return -1
            }
            for draw in draws {
                for singleColorCubes in draw.components(separatedBy: ", ") {
                    guard let amount = Int(singleColorCubes.components(separatedBy: " ")[0]) else {
                        return -1
                    }
                    let color = singleColorCubes.components(separatedBy: " ")[1]
                    
                    if currentGameMin[color] == 0 {
                        currentGameMin[color] = amount
                    } else if amount > currentGameMin[color] ?? -1 {
                        currentGameMin[color] = amount
                    }
                }
            }
            result += (currentGameMin["red"] ?? 0) * (currentGameMin["green"] ?? 0) * (currentGameMin["blue"] ?? 0)
        }
            return result
    }
}
