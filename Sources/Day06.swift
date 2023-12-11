import Algorithms

struct Day06: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
    var dataPerLine: [String] {
        data.components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
    
    var raceLengths: [Int] {
        dataPerLine.first?.components(separatedBy: .whitespaces).compactMap { Int($0) } ?? []
    }
    
    var distances: [Int] {
        dataPerLine.last?.components(separatedBy: .whitespaces).compactMap { Int($0) } ?? []
    }
    

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var results: [Int] = []
      
      for (race, raceLength) in raceLengths.enumerated() {
          var possibleWaysToWin = 0
          
          for speed in 0...raceLength {
              let currentDistance = speed * (raceLength - speed)
          
              if currentDistance > distances[race] {
                  possibleWaysToWin += 1
              }
          }
          results.append(possibleWaysToWin)
      }
      
      return results.reduce(1, *)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      let raceLength = Int(raceLengths.map { String($0) }.joined()) ?? 0
      let distance = Int(distances.map { String($0) }.joined()) ?? 0
      var possibleWaysToWin = 0
      
      for speed in 0...raceLength {
          let currentDistance = speed * (raceLength - speed)
      
          if currentDistance > distance {
              possibleWaysToWin += 1
          }
      }
      
      return possibleWaysToWin
  }
}
