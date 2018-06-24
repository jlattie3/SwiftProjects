//
//  List.swift
//  List
//
//  Created by Jacob Lattie on 5/8/18.
//  Copyright © 2018 Jacob Lattie. All rights reserved.
//

import Foundation

class List {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var numPairs = 0
    var gameCounter = 0
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    gameCounter += 1
                    print("\(gameCounter)")
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // one card up or 2 cards
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        var shuffled = [Card]()
        for _ in 0..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            shuffled.append(cards[randomIndex])
            cards.remove(at: randomIndex)
        }
        cards = shuffled
        numPairs = cards.count
    }
}
