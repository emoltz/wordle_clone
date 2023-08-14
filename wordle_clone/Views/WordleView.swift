import SwiftUI

struct WordleView: View{
    // variables to keep track of what is happening
    @ObservedObject var game = WordleGame()
    @State private var currentInput: String = ""
    @State private var currentRow: Int = 0
    @State private var rows: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
    
    @State private var guessResults: [[Character]] = Array(repeating: startingPosition, count: 5)
    @State private var shareImageTiles: [[String]] = []
    @State var showErrorAlert: Bool = false
    @State private var resetGame: Bool = false
    
    var body: some View {
        
        
        VStack{
            TitleView(resetGame: $resetGame)
            VStack (spacing: 20){
                ForEach(rows.indices, id:\.self){ i in
                    GameBoardRow(characters: $rows[i], results: guessResults[i])
                }
            }
            .padding(20)
            
            
            Spacer()
            
            OnScreenKeyboard(currentInput: $currentInput, onBackspace: handleBackspace)
            
            Button("GUESS!") {
                enterGuess()
                
            }
            .padding()
            .font(.custom("Oswald-Regular", size:20))
            .foregroundColor(.white)
            .background(Color("GuessButton"))
            .cornerRadius(10)
            
            
        }
        .onChange(of: currentInput){ newValue in
            processInput(newValue)
            
        }
        .onChange(of:resetGame){ newValue in
            if newValue{
                resetUI()
                game.resetGame()
                resetGame = false
            }
        }
        .onChange(of: game.gameOver) { newValue in
            if newValue{
                shareImageTiles = createShareImage()
            }
        }
        .sheet(isPresented: $game.gameOver){
            VStack{
                GameOverSheetView(shareImageTiles: $shareImageTiles)
                
                Button("Play Again?") {
                    game.resetGame()
                    resetUI()
                    
                }
                
            }
            
            
            
        }
        
        
    }
    
    // UI Related functions to talk to the backend
    private func enterGuess(){
        
        let guessWord = rows[currentRow].joined()
        
        if guessWord.count != 5{
//            print("Not enough letters in guess")
            showErrorAlert = true
            rows[currentRow] = resetRow
            return
        }
        
        guessResults[currentRow] = game.guess(word: guessWord)
//        print("Guessed: \(guessWord), Result: \(guessResults[currentRow])")
//        print(guessResults)
        
        if !game.isGameOver{
            currentRow += 1
        }
    }
    
    private func processInput(_ input: String) {
        guard currentRow < rows.count, let index = rows[currentRow].firstIndex(where: { $0.isEmpty }) else {
            print("no more room!")
            return
        }
        rows[currentRow][index] = input
        //        print("Characters: \(rows[currentRow])")
        
        currentInput = ""
    }
    
    private func handleBackspace(){
        guard currentRow < rows.count, !rows[currentRow].isEmpty else{
            return
        }
        
        if let lastIndex = rows[currentRow].lastIndex(where: {!$0.isEmpty}){
            rows[currentRow][lastIndex] = ""
        }
    }
    
    private func resetUI(){
        currentInput = ""
        currentRow = 0
        rows = Array(repeating: Array(repeating: "", count: 5), count: 5)
        for index in guessResults.indices {
            guessResults[index] = startingPosition
        }
    }
    
    private func createShareImage() -> [[String]]{
        enum Squares: String{
            case green = "🟩"
            case yellow = "🟨"
            case gray = "⬜️"
        }
        
        var tiles = Array(repeating: Array(repeating: Squares.gray.rawValue, count: 5), count: 5)
        for i in 0..<guessResults.count{
            for j in 0..<guessResults[i].count {
                // create a row of tiles
                let character = guessResults[i][j]
                if character == "G"{
                    tiles[i][j] = Squares.green.rawValue
                }
                else if character == "Y"{
                    tiles[i][j] = Squares.yellow.rawValue
                }
                else if character == "R"{
                    tiles[i][j] = Squares.yellow.rawValue
                }
                else if character == "U"{
                    tiles[i][j] = ""
                }
                
            }
        }
        print(tiles)
        return tiles
        
    }
}




struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
