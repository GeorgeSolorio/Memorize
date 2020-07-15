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
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        
        if let chosenIndex  = self.index(of: card) {
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = true
        var content: CardContent
        var id: Int
    }
}

