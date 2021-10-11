//
//  EmojisMemorizeGame.swift
//  memorizeGame
//
//  Created by Smishra2 on 08/10/21.
//

import SwiftUI

class EmojisMemorizeGame : ObservableObject {
    
    static var emojis = ["🚗","🚕","🦼","🛵","🚝","🚠","🛫","🏰","🚀","🏯","🚆","🚂","🦽","☎️","📲","⌚️","🧿","🎥","⏰"]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
            MemoryGameModel(numberOfCardsPair: 4) { pairIndex in
                emojis[pairIndex]
            }
        }
    
    @Published private var model: MemoryGameModel<String> = createMemoryGame()
    
    var cards : Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // Mark: - Intent(s)
    
    func choose(_ card : MemoryGameModel<String>.Card){
        model.choose(card)
    }
}
