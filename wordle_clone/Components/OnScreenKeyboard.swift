import SwiftUI

struct OnScreenKeyboard: View {
    
    let rows: [[String]] = [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M"]
    ]
    @Binding var currentInput: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("TileColor"))
                .frame(width:.infinity, height: 150)
            VStack(spacing:10){
                ForEach(rows, id: \.self) {row in
                    HStack(spacing: 10){
                        ForEach(row, id: \.self){ character in
                            Button(action: {
                                currentInput = character
//                                print(currentInput)
                            }){
                                Text(character)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(minWidth:10, maxWidth:30)
                                    .background(Color("TileColor"))
                                    .cornerRadius(5)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct OnScreenKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        OnScreenKeyboard(currentInput: .constant("W"))
    }
}
