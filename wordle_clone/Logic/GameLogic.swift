import Foundation

class WordleGame: ObservableObject {
    @Published var targetWord: String
    @Published var attempts: Int = 0
    @Published var guessHistory: [String] = []
    @Published var gameOver: Bool = false
    var maxAttempts: Int = 6
    
    init() {
        // Select a random word from a predefined list
        let words = wordList
        targetWord = words.randomElement() ?? "SWIFT"
        print(targetWord)
    }
    
    func guess(word: String) -> [Character] {
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
                result.append("R") // Gray: incorrect letter
            }
        }
        
        return result
    }
    
    var isGameOver: Bool {
        // this checks to see if the game is over
        if (attempts >= maxAttempts || guessHistory.last == targetWord){
            gameOver = true
            return gameOver
        }
        else{
            return gameOver
        }
    }
    
    func resetGame() {
        // Reset the game state on the backend
        targetWord = wordList.randomElement() ?? "SWIFT"
        print(targetWord)
        attempts = 0
        guessHistory.removeAll()
        gameOver = false
    }
}

var sampleResults:[Character] = ["G", "Y", "Y", "Y", "R"]
var startingPosition:[Character] = ["U", "U", "U", "U", "U"]
var resetRow = Array(repeating:"", count:5)
var correctGuess = ["G", "G", "G", "G", "G"]
