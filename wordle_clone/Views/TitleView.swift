import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Wordle2")
                .font(.custom("Oswald-Bold", size:40))
                .padding()
            Spacer()
            Button(action: {}) {
                Image(systemName:"gear")
                    .font(.system(size:30))
                    .foregroundColor(Color("GearColor"))
            }
            .padding()
            
            
        }
        
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
