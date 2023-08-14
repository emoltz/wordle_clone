import SwiftUI
import MessageUI

struct ShareButton: View {
    @State private var isSharing = false
    @Binding var shareImageTiles: [[String]]
    
    var body: some View {
        Button(action: {
            isSharing = true
            
        }){
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width:20, height:20)
                .foregroundColor(.black)
        }
        .sheet(isPresented: $isSharing, content: {
            let itemsToShare: String = shareImageTiles.map { $0.joined(separator: " ") }
                                                      .joined(separator: "\n")
            ActivityViewController(activityItems: [itemsToShare], applicationActivities: nil)

        })
        
    }
}

struct ActivityViewController: UIViewControllerRepresentable{
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
        
    }

}

