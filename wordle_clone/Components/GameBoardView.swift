import SwiftUI

struct GameBoardView: View {
    @State private var characters: [String] = Array(repeating: "W", count: 25)
    var body: some View {
        VStack{
            Text("Hello")
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
