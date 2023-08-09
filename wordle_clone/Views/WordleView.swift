import SwiftUI

struct WordleView: View{
    // variables to keep track of what is happening
    @ObservedObject var game = WordleGame()
    @State private var currentInput: String = ""
    @State private var currentRow: Int = 0
    @State private var rows: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
    
    @State private var guessResults: [[Character]] = Array(repeating: startingPosition, count: 5)
    @State var showErrorAlert: Bool = false
    
    var body: some View {
        
        VStack{
            VStack (spacing: 20){
                ForEach(rows.indices, id:\.self){ i in
                    GameBoardRow(characters: $rows[i], results: guessResults[i])
                }
            }
            .padding(20)
            
            
            Spacer()
            
            OnScreenKeyboard(currentInput: $currentInput, onBackspace: handleBackspace)
            
            Button("Guess!") {
                enterGuess()
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color("GuessButton"))
            .cornerRadius(10)
            .fontWeight(.bold)
            
        }
        .onChange(of: currentInput){ newValue in
            processInput(newValue)
            
        }
        .alert(isPresented: $game.gameOver){
            Alert(
                title: Text("Game Over"),
                message: Text("Would you like to play again?"),
                primaryButton: .default(Text("Restart"), action:{
                    game.resetGame()
                    resetUI()
                    
                }
                                       ),
                secondaryButton: .cancel()
            )
        }
        // TODO: add alert when 5 letter word not entered
        
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
        
        
        // use guessResult to update UI
        print("Guessed: \(guessWord), Result: \(guessResults[currentRow])")
        
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
}




struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
