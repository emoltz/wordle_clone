import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("Settings")
                .font(.custom("Oswald-Bold", size: 35))
            Spacer()
            Button("Restart Game"){
                // TODO: functionality
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
        SettingsView()
    }
}
