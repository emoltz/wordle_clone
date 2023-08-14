import SwiftUI

struct TitleOswaldBold: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.custom("Oswald-Bold", size:40))
    }
}
