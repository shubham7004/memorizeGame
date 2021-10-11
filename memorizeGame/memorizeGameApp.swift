//
//  memorizeGameApp.swift
//  memorizeGame
//
//  Created by Smishra2 on 05/10/21.
//

import SwiftUI

@main
struct memorizeGameApp: App {
    let game = EmojisMemorizeGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
