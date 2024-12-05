//
//  Model.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//
import Foundation

// Player model
struct Player {
    var id: String
    var hp: Int
    var speed: Int
    var power: Int
    var quests: [Quest]
}

// Quest model
struct Quest: Identifiable {
    var id = UUID()
    var name: String
}
