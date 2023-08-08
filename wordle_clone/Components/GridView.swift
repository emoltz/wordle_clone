import SwiftUI

struct GridView: View {
    @State private var characters: [String] = Array(repeating: "W", count: 25)
    var body: some View {
        VStack {
            ForEach(0..<5) { row in
                HStack {
                    ForEach(0..<5) { column in
                        Tile(tileColor: Color("TileColor"), character: $characters[row * 5 + column])
                    }
                }
            }
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
