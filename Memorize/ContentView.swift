//
//  ContentView.swift
//  Memorize
//
//  Created by Luan dos Santos on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
            Text("👻").font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
