//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by George Solorio on 6/25/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        Grid (game.cards) { card in
            CardView(card: card).onTapGesture() {
                self.game.choose(card: card)
            }
            .padding(5)
            .foregroundColor(Theme.color)
        }
        .padding()
    }
}

struct CardView: View {
    
    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(120 - 90), clockWise: true).padding(5).opacity(0.5)
                Text("\(card.content)").font(Font.system(size: fontSize(for: size)))
            }
            .cadify(isFaceUp: card.isFaceUp)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(game: game)
    }
}
