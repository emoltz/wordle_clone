import SwiftUI

struct WordleView: View{
   
    var body: some View {
        VStack{
            GameBoardView()
                .padding()
            Spacer()
            Text("Keyboard here")
        }
        .padding()
        
        
    }
}


struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
