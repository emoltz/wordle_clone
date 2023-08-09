import SwiftUI



struct Tile: View{
    var tileColor:Color
    @Binding var character: String
    @State private var isEditing: Bool = false
    var result: Character?
    private var displayColor: Color{
        if let result = result{
            return result == "G" ? Color("CorrectTile") :
            result == "Y" ? Color("WrongPlacementTile") :
            result == "R" ? Color("IncorrectTile") :
            result == "U" ? Color("StartingTile") : tileColor
        } else{
            return tileColor
        }
    }
    
    var body: some View{
        
        ZStack {
            Rectangle()
                .foregroundColor(displayColor)
                .frame(width: 65,height: 65)
                .cornerRadius(10)
            Text(character)
                .font(.system(size:40))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .onTapGesture {
            isEditing.toggle()
        }
        
    }
}


struct Tile_Preview: PreviewProvider {
    static var previews: some View {
        Tile(tileColor: Color("TileColor"), character: .constant("W"), result: "Y")
    }
}
