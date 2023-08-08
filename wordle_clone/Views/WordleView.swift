import SwiftUI

struct WordleView: View{
    @State private var characters: [String] = Array(repeating: "", count: 5)
    @State private var currentInput: String = ""
    
    var body: some View {
        
        VStack{
            GameBoardView(characters: $characters)
                .padding()
            Spacer()
            OnScreenKeyboard(currentInput: $currentInput)
        }
        .onChange(of: currentInput){ newValue in
            processInput(newValue)
            
        }
 
    }
    
    private func processInput(_ input: String){
        // the point of the below line is to find the place with the "" and get me that index
        // `guard`makes sure that this works before moving on to the rest of the code
        guard let index = characters.firstIndex(where: {$0.isEmpty}) else {
            print("no more room!")
            return
            
        }
        characters[index] = input
        print("Characters: \(characters)")
        
        currentInput = ""
    }
}




struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
