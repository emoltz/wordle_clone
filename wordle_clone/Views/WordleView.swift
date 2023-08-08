import SwiftUI

struct WordleView: View{
   
    var body: some View {
        VStack{
            GridView()
                .padding()
            Spacer()
            Text("Keyboard here")
        }
        
        
    }
}


struct WordleView_Preview: PreviewProvider {
    static var previews: some View {
        WordleView()
        
    }
}
