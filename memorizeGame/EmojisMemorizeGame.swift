//
//  EmojisMemorizeGame.swift
//  memorizeGame
//
//  Created by Smishra2 on 08/10/21.
//

import SwiftUI

class EmojisMemorizeGame : ObservableObject {
    
    var newtheme : Theme
    @Published private var model: MemoryGameModel<String>
    
    init() {
        newtheme = theme.randomElement()!
        newtheme.emoji.shuffle()
        model = EmojisMemorizeGame.createMemoryGame(theme : newtheme)
    }
    var theme : Array<Theme> = [
        Theme(themeName: "Vehical", emoji: ["🚗","🚕","🦼","🛵","🚝","🚠"], numberOfCardPair: 5, color: "darkGray"),
        Theme(themeName: "Animals", emoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐸"], numberOfCardPair: 8, color: "red"),
        Theme(themeName: "Nature", emoji: ["🌵","🎄","🌲","🌳","🌴","🌾","🍁","💐"], numberOfCardPair: 6, color: "green")
    ]
    
    static func createMemoryGame(theme : Theme ) -> MemoryGameModel<String> {
        var size : Int = theme.numberOfCardPair
        if size > theme.emoji.count {
            size = theme.emoji.count
        }
        let model = MemoryGameModel<String>( numberOfPairsIndex: size) { pairIndex in
            theme.emoji[pairIndex]
        }
        return model
    }
    
    var themeColor: Color  {
    switch(newtheme.color) {
        case "red" :
            return .red
            
        case "darkGrey":
            return .gray
            
        case "green":
            return .green
        default :
            return .yellow
        }
    }
    
    var cards : Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    // MARK: - Intent(s) 
    
    func choose(_ card : MemoryGameModel<String>.Card){
        model.choose(card)
    }
    
    //reset function
    func resetGame(){
        newtheme = theme.randomElement()!
        newtheme.emoji.shuffle()
        model = EmojisMemorizeGame.createMemoryGame(theme : newtheme)
        
    }
    
}

