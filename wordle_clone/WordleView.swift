import SwiftUI

struct WordleView: View{
    @State private var game = WordleGame()
    @State private var currentGuess = ""
    @State private var guessResult: [Character] = []
    
    var body: some View {
        VStack{
            List(game.guessHistory, id: \.self) { guess in
                HStack{
                    Text(guess)
                    Spacer()
                    ForEach(guessResult, id: \.self) {result in
                        Circle()
                            .fill(result == "G" ? Color.green : (result == "Y" ? Color.yellow : Color.red))
                            .frame(width:10, height: 10)
                    }
                }
            }
            
            // input fields
            TextField("Enter your guess", text: $currentGuess)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
            
            // button to submit a guess
            Button("Guess"){
                guard currentGuess.count == game.targetWord.count else { return }
                guessResult = game.guess(word: currentGuess)
                currentGuess = ""
            }
            .disabled(game.isGameOver)
            
            // display game over message
            if game.isGameOver{
                Text("Game over! The word was \(game.targetWord)")
            }
            
        }
    }
}


struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
