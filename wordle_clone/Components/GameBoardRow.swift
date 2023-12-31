import SwiftUI

struct GameBoardRow: View {
    @Binding var characters: [String]
    var results: [Character]
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 30), count: 5)
        
        LazyVGrid(columns: columns, spacing: 20){
            ForEach(characters.indices, id: \.self) { index in
                Tile(tileColor: Color("TileColor"), character: $characters[index], result: results[index])
            }
        }
        
        /// Grid implentation below:
        
        //        Grid{
        //            GridRow{
        //                ForEach(characters.indices, id: \.self){index in
        //                    Tile(tileColor: Color("TileColor"), character: $characters[index], result: results[index])
        //                }
        //            }
        
    }
}


struct GameBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardRow(characters: .constant(["W", "O", "R", "D", "S"]), results: sampleResults)
    }
}
