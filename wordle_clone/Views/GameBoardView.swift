import SwiftUI

struct GameBoardView: View {
    @Binding var characters: [String]
    @State private var rowNumber = 0
    var results: [Character]
    var body: some View {
        VStack{
            ForEach(0..<5){ i in
                GameBoardRow(characters: $characters, results: results)
            }
            
        }
       
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView(characters: .constant(["W", "O", "R", "D", "S"]), results: sampleResults)
    }
}

