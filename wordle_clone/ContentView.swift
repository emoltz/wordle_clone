//
//  ContentView.swift
//  wordle_clone
//
//  Created by Ethan Shafran Moltz on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WordleView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
