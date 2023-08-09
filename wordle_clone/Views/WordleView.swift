import SwiftUI

struct WordleView: View{
    @State private var currentInput: String = ""
    @State private var currentRow: Int = 0
    @State private var rows: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
    @ObservedObject var game = WordleGame()
    @State private var guessResult: [Character] = startingPosition
    
    var body: some View {
        
        VStack{
            ForEach(rows.indices, id:\.self){ i in
                GameBoardRow(characters: $rows[i], results: guessResult)
            }
            .padding()
            
            
            Spacer()
            
            OnScreenKeyboard(currentInput: $currentInput, onBackspace: handleBackspace)
            
            Button("Guess!") {
                enterGuess()

            }
            .padding()
            .foregroundColor(.white)
            .background(Color("TileColor"))
            .cornerRadius(10)
            .fontWeight(.bold)
            
        }
        .onChange(of: currentInput){ newValue in
            processInput(newValue)
            
        }
        
    }
    
   
    private func enterGuess(){
        
        let guessWord = rows[currentRow].joined()
        
        if guessWord.count != 5{
            print("Not enough letters in guess")
            rows[currentRow] = resetRow
            return
        }
        
        guessResult = game.guess(word: guessWord)
    
        
        // use guessResult to update UI
        print("Guessed: \(guessWord), Result: \(guessResult)")
        
        if game.isGameOver{
            print("Game Over")
        }
        else{
            currentRow += 1
        }
    }
    
    private func processInput(_ input: String) {
               guard currentRow < rows.count, let index = rows[currentRow].firstIndex(where: { $0.isEmpty }) else {
                   print("no more room!")
                   return
               }
               rows[currentRow][index] = input
               print("Characters: \(rows[currentRow])")
               
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
}




struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
