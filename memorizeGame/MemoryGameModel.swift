//
//  MemoryGameModel.swift
//  memorizeGame
//
//  Created by Smishra2 on 08/10/21.
//

import Foundation
import UIKit

struct MemoryGameModel<cardContent> where cardContent: Equatable{
    
    private(set) var cards : Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    mutating func choose(_ card : Card) {
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched {
            
            if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchedIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
//    func index(of card : Card) -> Int?{
//        for i in 0..<cards.count {
//            if cards[index].id == card.id {
//                return i
//            }
//        }
//        return nil
//    }
    
    init ( theme: Theme, createCardContent: (String) -> cardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<theme.numberOfCardPair {
            cards.append(Card(content: createCardContent(theme.emoji[pairIndex]), id: pairIndex * 2))
            cards.append( Card(content: createCardContent(theme.emoji[pairIndex]), id: (pairIndex * 2) + 1))
        }
    }
    
    
    
    
    struct Card : Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content : cardContent
        let id : Int
    }
    
    struct Theme{
        var themeName : String
        var emoji : [String] = [["🚗","🚕","🦼","🛵","🚝","🚠"],["🏰","🚀","🛫","🏯","🚆","🚂","🦽"],
                               ["☎️","📲","⌚️","🧿","🎥","⏰"]].randomElement()!
        var numberOfCardPair : Int
        var color : String
    }
    
}


