import SwiftUI

struct GridView: View {
    @State private var characters: [String] = Array(repeating: "", count: 9)
    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        Tile(tileColor: Color("TileColor"), character: $characters[row * 3 + column])
                    }
                }
            }
        }
        Text("Hello")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
