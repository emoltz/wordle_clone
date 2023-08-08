import SwiftUI



struct Tile: View{
    var tileColor:Color
    @Binding var character: String
    @State private var isEditing: Bool = false
    
    var body: some View{
        ZStack {
            Rectangle()
                .foregroundColor(tileColor)
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
        Tile(tileColor: Color("TileColor"), character: .constant("W"))
    }
}
