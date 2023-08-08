import SwiftUI

struct WordleView: View{
   
    var body: some View {
        VStack{
            GameBoardView()
                .padding()
            Spacer()
            OnScreenKeyboard()
        }
        
        
        
    }
}


struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
