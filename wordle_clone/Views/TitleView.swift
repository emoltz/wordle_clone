import SwiftUI

struct TitleView: View {
    @State private var isSettingsViewPresented = false
    @Binding var resetGame:Bool

    
    var body: some View {
        HStack {
            Text("Wordle2")
                .font(.custom("Oswald-Bold", size:40))
                .padding()
            Spacer()
            Button(action: {
                isSettingsViewPresented.toggle()
            }) {
                Image(systemName:"gear")
                    .font(.system(size:30))
                    .foregroundColor(Color("GearColor"))
            }
            .sheet(isPresented: $isSettingsViewPresented){
                SettingsView(resetGame: $resetGame)
                // TODO: close sheet on press of button
            }
            .padding()
            
            
        }
        
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(resetGame: .constant(false))
    }
}
