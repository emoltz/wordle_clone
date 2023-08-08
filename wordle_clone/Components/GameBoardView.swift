import SwiftUI

struct GameBoardView: View {
    @State private var characters: [String] = Array(repeating: "W", count: 25)
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: 5)

        LazyVGrid(columns: columns, spacing: 20){
            ForEach(characters.indices, id: \.self) { index in
                            Tile(tileColor: Color("TileColor"), character: $characters[index])
                        }
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
