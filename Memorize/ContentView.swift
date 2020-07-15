//
//  ContentView.swift
//  Memorize
//
//  Created by George Solorio on 6/25/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var game: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(game.cards) { card in
                CardView(card: card).onTapGesture() {
                    self.game.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("\(card.content)")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: EmojiMemoryGame())
    }
}
