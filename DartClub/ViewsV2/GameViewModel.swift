//
//  GameViewModel.swift
//  DartClub
//
//  Created by Antoine on 27/04/2024.
//

import SwiftUI

struct Player {
    var name: String = ""
    var scores: [[Int]] = []
    var remainingScore: Int
}

struct Game {
    var players: [Player]
    var gameType: Int
    var currentTurn: Int = 1
}

class GameViewModel: ObservableObject {
    @Published var currentGame: Game
    @Published var gameStarted: Bool = false

    init(gameType: Int) {
        let initialPlayer = Player(name: "", scores: [], remainingScore: gameType)  // Assurez-vous que les propriétés sont correctement initialisées
        self.currentGame = Game(players: [initialPlayer], gameType: gameType)
    }
    
    func addPlayer() {
        if currentGame.players.count < 4 {
            currentGame.players.append(Player(remainingScore: currentGame.gameType))
        }
    }
    
    
    func addScore(forPlayer index: Int, score: [Int]) {

        print("----------------------------------------")
        print("Function addScore OK")
        print("Tentative d'ajouter un score: \(score)")
        
        guard score.count == 3 else {
            
            print("Score incorrect, attendu 3 valeurs, reçu : \(score.count)")
            
            return
        }
        
        currentGame.players[index].scores.append(score)
        
        if index == currentGame.players.count - 1 {
            
            currentGame.currentTurn += 1
            
        }
        
        print("Current turn : \(currentGame.currentTurn)")
    }

    
    func undoLastScore(forPlayer index: Int) {
        
        print("----------------------------------------")
        print("Function undoLastScore 01")
        
        if !currentGame.players[index].scores.isEmpty {
            
            currentGame.players[index].scores.removeLast()
            
        }
        
    }
}