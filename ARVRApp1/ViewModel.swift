import Foundation

class PlayerViewModel: ObservableObject {
    @Published var player: Player
    @Published var showARGame: Bool = false
    @Published var monsterHP: Int = 100
    @Published var gameResult: String = "" // "Win" or "Game Over"
    @Published var showEndDialog: Bool = false
    @Published var isInAR: Bool = false // Flag to track whether user is in AR

    private var monsterAttackTimer: Timer?
    private var attackDelayTimer: Timer?

    init(player: Player) {
        self.player = player
    }

    // Handle player attack and monster's counterattack
    func attackMonster() {
        monsterHP -= Int.random(in: 10...20)
        if monsterHP <= 0 {
            gameResult = "Win"
            showEndDialog = true
        }
    }
    
    // Handle the monster's attack
    func monsterAttacks() {
        let damage = Int.random(in: 5...15)
        player.hp -= damage
        if player.hp <= 0 {
            gameResult = "Game Over"
            showEndDialog = true
            stopMonsterAttack() // Stop the monster's attack
        }
    }
    
    // Start the monster's attack after a delay of 10 seconds
    func startMonsterAttacksAfterDelay() {
        attackDelayTimer?.invalidate() // Invalidate any previous timer
        attackDelayTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            self.startMonsterAttack()
        }
    }
    
    // Start monster's attack
    private func startMonsterAttack() {
        monsterAttackTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            self.monsterAttacks()
        }
    }
    
    // Stop the monster's attack
    private func stopMonsterAttack() {
        monsterAttackTimer?.invalidate() // Stop the monster attack timer
        monsterAttackTimer = nil
    }

    // Handle entering and leaving the AR view
    func didEnterAR() {
        isInAR = true
        startMonsterAttacksAfterDelay() // Start monster attacks after 10 seconds
    }
    
    func didExitAR() {
        isInAR = false
        stopMonsterAttack() // Stop monster's attack when the user leaves AR
    }

    // Toggle the play state
    func startGame() {
        showARGame = true
    }
}
