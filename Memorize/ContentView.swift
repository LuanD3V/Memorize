//
//  ContentView.swift
//  Memorize
//
//  Created by Luan dos Santos on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🕷️", "👻", "😈", "😄", "🥹", "🥰", "🤫", "☠️", "🥶",]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 66))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/4, contentMode: .fit)
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
                .font(.largeTitle)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill" )
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill" )
    }
}

struct CardView: View {
    let content: String
   @State var isFaceUp: Bool =  true
    
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
