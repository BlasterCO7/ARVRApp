//
//  PlayerStatsView.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//

import SwiftUI
import RealityKit

// PlayerStatsView to display player stats and quests
struct PlayerStatsView: View {
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Player stats and other content
                Text("Player ID: \(viewModel.player.id)")
                    .font(.headline)

                // Stat bars
                StatBar(label: "HP", value: viewModel.player.hp, color: .green)
                StatBar(label: "Speed", value: viewModel.player.speed, color: .blue)
                StatBar(label: "Power", value: viewModel.player.power, color: .red)

                // List of quests using viewModel.player.quests
                List(viewModel.player.quests) { quest in
                    Text(quest.name)
                }

                // Play button that triggers AR Game
                Button("Play") {
                    viewModel.startGame()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)

                // Conditional NavigationLink to AR Game
                NavigationLink(
                    destination: ARGameView(viewModel: viewModel),
                    isActive: $viewModel.showARGame
                ) {
                    EmptyView() // We do not want the NavigationLink to show any UI, just trigger the navigation
                }
            }
            .navigationTitle("Player Stats")
        }
    }
}

// ARGameView where the AR game is played
struct ARGameView: View {
    @ObservedObject var viewModel: PlayerViewModel
    @State private var arView: ARView!

    var body: some View {
        ZStack {
            ARViewContainer(arView: $arView) // Your ARViewContainer showing the 3D world
            
            VStack {
                // Player's HP and Monster's HP in a stat bar format
                StatBar(label: "Monster HP", value: viewModel.monsterHP, color: .red)
                Spacer()
                StatBar(label: "Your HP", value: viewModel.player.hp, color: .green)
                
                // Attack button for the user to attack the monster
                Button("Attack") {
                    viewModel.attackMonster()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .onAppear {
            viewModel.didEnterAR()
        }
        .onDisappear {
                    viewModel.didExitAR() 
                }
        .alert(isPresented: $viewModel.showEndDialog) {
            Alert(
                title: Text(viewModel.gameResult),
                message: Text("Tap OK to continue."),
                dismissButton: .default(Text("OK")) {
                    // Return to the previous screen after game over or win
                }
            )
        }
    }
}

