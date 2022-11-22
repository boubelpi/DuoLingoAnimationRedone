//
//  ContentView.swift
//  DuoLingoAnimationRedone
//
//  Created by Pavel on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("LOADING...")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(.gray)
            Text(txt.find_text_under_animation())
                .font(.body)
                .padding(2)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
