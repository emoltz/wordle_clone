import Foundation

struct WordleGame {
    var targetWord: String
    var attempts: Int = 0
    var guessHistory: [String] = []
    var maxAttempts: Int = 6

    init() {
        // Select a random word from a predefined list
        let words = ["apple", "water", "swift", "money", "plant"]
        targetWord = words.randomElement() ?? "apple"
    }

    mutating func guess(word: String) -> [Character] {
        attempts += 1
        guessHistory.append(word)
        return evaluateGuess(guess: word)
    }

    private func evaluateGuess(guess: String) -> [Character] {
        var result: [Character] = []
        
        for (index, letter) in guess.enumerated() {
            let targetIndex = targetWord.index(targetWord.startIndex, offsetBy: index)
            if targetWord.contains(letter) {
                if targetWord[targetIndex] == letter {
                    result.append("G") // Green: correct letter in the correct position
                } else {
                    result.append("Y") // Yellow: correct letter but in the wrong position
                }
            } else {
                result.append("R") // Red: incorrect letter
            }
        }
        
        return result
    }
    
    var isGameOver: Bool {
        return attempts >= maxAttempts || guessHistory.last == targetWord
    }
}
