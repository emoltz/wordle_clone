import SwiftUI

struct OnScreenKeyboard: View {
    
    let rows: [[String]] = [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M"] // Third row
    ]
    @Binding var currentInput: String
    var onBackspace: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("TileColor"))
                .frame(width:.infinity, height: 150)
            VStack(spacing:10){
                ForEach(rows.indices, id: \.self) { rowIndex in
                    HStack(spacing: 10){
                        ForEach(rows[rowIndex], id: \.self){ character in
                            Button(action: {
                                currentInput = character
                            }){
                                Text(character)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(minWidth:10, maxWidth:30)
                                    .background(Color("TileColor"))
                                    .cornerRadius(5)
                            }
                        }
                        
                        // Add a backspace button next to the "M" key in the third row
                        if rowIndex == 2 {
                            
                            Button(action: onBackspace) {
                                Image(systemName: "delete.left.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(minWidth: 10, maxWidth: 30)
                                    .background(Color("TileColor"))
                                    .cornerRadius(5)
                            }
                            .offset(x:15)
                            
                        }
                    }
                }
            }
        }
    }
}

struct OnScreenKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        OnScreenKeyboard(currentInput: .constant("W"), onBackspace: {})
    }
}
