//
//  ContentView.swift
//  Memorize
//
//  Created by Luan dos Santos on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
        }
    }
}

struct CardView: View {
    var isFaceUp: Bool =  false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.black)
            }
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
