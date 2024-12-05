//
//  ARVRApp1App.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//

import SwiftUI

@main
struct ARVRApp1App: App {
//    @State private var player = Player(id: "Player1", hp: 100, speed: 50, power: 75, quests: [Quest(name: "Defeat the Monster"), Quest(name: "Find the Treasure")])
//        @StateObject private var playerViewModel: PlayerViewModel
//        
//        init() {
//            _playerViewModel = StateObject(wrappedValue: PlayerViewModel(player: player))
//        }

        var body: some Scene {
            WindowGroup {
                PlayerStatsView(viewModel: PlayerViewModel(player: Player(id: "Player1", hp: 100, speed: 50, power: 75, quests: [Quest(name: "Defeat the Monster"), Quest(name: "Find the Treasure")])))
            }
        }
}
