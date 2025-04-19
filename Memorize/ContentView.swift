//
//  ContentView.swift
//  Memorize
//
//  Created by Luan dos Santos on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🕷️", "👻", "😈", "😄", "🥹", "🥰", "🤫", "☠️", "🥶"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/4, contentMode: .fit)
        }
    }
    
}

struct CardView: View {
    let content: String
   @State var isFaceUp: Bool =  false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12);
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
