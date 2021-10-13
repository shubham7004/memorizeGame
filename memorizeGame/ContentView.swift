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
            Text("Memorize 🧠 Game").font(.system(size: 30)).foregroundColor(.purple)
                .background(Color(red: 0.5, green: 0, blue: 0.5))
                .clipShape(Rectangle())
            HStack {
                Text(viewModel.newtheme.themeName).font(.system(size: 24))
                Spacer()
                Text("Score: \(viewModel.score)").font(.system(size: 20))
            }.padding()
            ScrollView{
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 60))]){
                    ForEach(viewModel.cards) { card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            
            
            Button  {
                viewModel.resetGame()
            } label: {
                Text("New Game").font(.largeTitle)
            }
            .padding(5)
            .foregroundColor(.green)
            .background(Color(.init(red: 0.3, green: 0.2, blue: 0.8, alpha: 0.8)))
            .clipShape(Capsule())
            
        }
        

        
    }
}
struct cardView: View {
    var card : MemoryGameModel<String>.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack{
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
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
