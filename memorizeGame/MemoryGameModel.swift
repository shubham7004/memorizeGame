//
//  MemoryGameModel.swift
//  memorizeGame
//
//  Created by Smishra2 on 08/10/21.
//

import Foundation

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
    
    init ( numberOfCardsPair : Int , createCardContent: (Int) -> cardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfCardsPair {
            cards.append(Card(content: createCardContent(pairIndex), id: pairIndex * 2))
            cards.append( Card(content: createCardContent(pairIndex), id: (pairIndex * 2) + 1))
        }
    }
    
    
    
    
    struct Card : Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : cardContent
        var id : Int
    }
    
}
