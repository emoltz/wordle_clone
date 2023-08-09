import SwiftUI

struct WordleView: View{
    @State private var characters: [String] = Array(repeating: "", count: 5)
    @State private var currentInput: String = ""
    @State private var currentRow: Int = 0
    @State private var rows: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
    
    var body: some View {
        
        VStack{
            ForEach(rows.indices, id:\.self){ i in
                GameBoardRow(characters: $rows[i])
            }
            .padding()
            
            
            Spacer()
            
            OnScreenKeyboard(currentInput: $currentInput)
            
            Button("Guess!") {
                print("Pressed")
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
    
    private func processInput(_ input: String) {
            guard currentRow < rows.count, let index = rows[currentRow].firstIndex(where: { $0.isEmpty }) else {
                print("no more room!")
                return
            }
            rows[currentRow][index] = input
            print("Characters: \(rows[currentRow])")
            
            currentInput = ""
        }
}




struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
