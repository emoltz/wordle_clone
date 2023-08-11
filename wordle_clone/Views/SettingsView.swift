import SwiftUI

struct SettingsView: View {
    @Binding var resetGame:Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("Settings")
                .font(.custom("Oswald-Bold", size: 35))
            Spacer()
            Button("Restart Game"){
                resetGame = true
                presentationMode.wrappedValue.dismiss()

            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .fontWeight(.bold)
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(resetGame: .constant(false))
    }
}
