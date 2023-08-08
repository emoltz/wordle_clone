//
//  GameBoardRow.swift
//  wordle_clone
//
//  Created by Ethan Shafran Moltz on 8/8/23.
//

import SwiftUI

struct GameBoardRow: View {
    @Binding var characters: [String]
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: 5)
        
        LazyVGrid(columns: columns, spacing: 20){
            ForEach(characters.indices, id: \.self) { index in
                Tile(tileColor: Color("TileColor"), character: $characters[index])
            }
        }
    }
}

struct GameBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardRow(characters: .constant(["W", "O", "R", "D", "S"]))
    }
}
