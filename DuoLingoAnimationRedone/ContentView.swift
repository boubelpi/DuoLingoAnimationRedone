//
//  ContentView.swift
//  DuoLingoAnimationRedone
//
//  Created by Pavel on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State var current_text = txt.find_text_under_animation()
    var body: some View {
        VStack {
            Text("LOADING...")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(.gray)
            Text(current_text)
                .font(.body)
                .padding(5)
                .onReceive(timer) {_ in
                    self.current_text = txt.find_text_under_animation()
                    
                }
                }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
