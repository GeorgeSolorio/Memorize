//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by George Solorio on 7/14/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var memoryGame = createMemoryGame()
        
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = Theme.emojis
        let numberOfPairs = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairOfCards: numberOfPairs) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: Access to the model
    var cards: [MemoryGame<String>.Card] {
        return memoryGame.cards
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
