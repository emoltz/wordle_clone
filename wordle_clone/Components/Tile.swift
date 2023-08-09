import SwiftUI

struct Tile: View{
    var tileColor:Color
    @Binding var character: String
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
                .frame(width: 60,height: 60)
                .cornerRadius(10)
            Text(character)
                .font(.system(size:40))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        
    }
}


struct Tile_Preview: PreviewProvider {
    static var previews: some View {
        Tile(tileColor: Color("TileColor"), character: .constant("W"), result: "G")
    }
}
