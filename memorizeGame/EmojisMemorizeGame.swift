//
//  EmojisMemorizeGame.swift
//  memorizeGame
//
//  Created by Smishra2 on 08/10/21.
//

import SwiftUI

class EmojisMemorizeGame : ObservableObject {
    
    var newtheme : MemoryGameModel<String>.Theme
    
    init() {
        if newtheme.emoji.contains("🛫") {
            newtheme.themeName = "theme 2"
            newtheme.color = "red"
        }
        else if newtheme.emoji.contains("🚗") {
            newtheme.themeName = "theme 1"
            newtheme.color = "blue"
        } else {
            newtheme.themeName = "theme 3"
            newtheme.color = "grey"
        }
        newtheme.numberOfCardPair = newtheme.emoji.count - 1
        
    }
    
    static func createMemoryGame( ) -> MemoryGameModel<String> {
        MemoryGameModel(theme: newtheme, createCardContent: { element in
            newtheme.emojis
        })
        }
    
    @Published private var model: MemoryGameModel<String> = createMemoryGame(themeArray: emojis)
    
    var cards : Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // Mark: - Intent(s)
    
    func choose(_ card : MemoryGameModel<String>.Card){
        model.choose(card)
    }
}

