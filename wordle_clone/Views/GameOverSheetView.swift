//
//  GameOverSheetView.swift
//  wordle_clone
//
//  Created by Ethan Shafran Moltz on 8/14/23.
//

import SwiftUI

struct GameOverSheetView: View {
    @Binding var shareImageTiles:[[String]]
    var body: some View {
        VStack{
            TitleOswaldBold(text: "Game Over!")
            HStack {
                Text("Share your results:")
                ShareButton(shareImageTiles: $shareImageTiles)
            }
        }
      
    }
}

struct GameOverSheetView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverSheetView(shareImageTiles: .constant([["G", "G"]]))
    }
}
