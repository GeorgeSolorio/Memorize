//
//  MemoryGame.swift
//  Memorize
//
//  Created by George Solorio on 7/14/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards = [Card]()
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        for pairIndex in 0..<numberOfPairOfCards {
            
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = true
        var content: CardContent
        var id: Int
    }
}

