import SwiftUI



struct Tile: View{
    var tileColor:Color = Color("TileColor")
    @Binding var character: String
    @State private var isEditing: Bool = false
    
    var body: some View{
        ZStack {
            Rectangle()
                .foregroundColor(tileColor)
                .frame(width: 70,height: 70)
                .cornerRadius(10)
            Text(character)
                .font(.system(size:40))
                .foregroundColor(.white)
        }
        .onTapGesture {
            isEditing.toggle()
        }
        
    }
}


struct Tile_Preview: PreviewProvider {
    static var previews: some View {
        Tile(character: .constant("T"))
    }
}
