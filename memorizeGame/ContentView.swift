//
//  ContentView.swift
//  memorizeGame
//
//  Created by Smishra2 on 05/10/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojisMemorizeGame
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 67))]){
                    ForEach(viewModel.cards) { card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .foregroundColor(.gray)
            
        }
    }
}
//        var addEmojis : some View = {
//            Button {
//                if emojyCount < emojis.count {
//                    emojyCount += 1
//                }
//            } label: {
//                Image(systemName: "plus.circle")
//            }
//        }
//        var removeEmojis : some View = {
//            Button {
//                if emojyCount > 1 {
//                    emojyCount -= 1
//                }
//            } label: {
//                Image(systemName: "minus.circle")
//            }
//        }


struct cardView: View {
    var card : MemoryGameModel<String>.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack{
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.red)
                Text(card.content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojisMemorizeGame()
        ContentView(viewModel: game)
    }
}
