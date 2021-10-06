//
//  ContentView.swift
//  memorizeGame
//
//  Created by Smishra2 on 05/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🚕","🦼","🛵","🚝","🚠","🛫","🏰","🚀","🏯","🚆","🚂","🦽","☎️","📲","⌚️","🧿","🎥","⏰"]
    @State var emojyCount = 5
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 67))]){
                    ForEach(emojis[0..<emojyCount], id: \.self) { emojy in
                        cardView(content: emojy)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            Spacer()
                
            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding()
        }
        .padding()
    }
           
    var add : some View {
        Button {
            if emojyCount < emojis.count {
                emojyCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove : some View {
        Button {
            if emojyCount > 1 {
                emojyCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
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
}


struct cardView: View {
    var content : String
    @State var isFlipOver : Bool = true
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack{
            if isFlipOver {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                    .foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        
            .onTapGesture {
                isFlipOver = !isFlipOver
            }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
