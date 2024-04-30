//
//  GameViewV2.swift
//  DartClub
//
//  Created by Antoine on 21/04/2024.
//

import SwiftUI

struct GameViewV2: View {
    
    var selectedGame: Int?
    var players: [Player]
    
    @State private var currentPlayerIndex: Int = 0
    @State private var enterThrowScore: Bool = false
    @State private var showInformationsView = false
    @State private var gameCount: Int = 1

    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {

                ZStack {

                    Color(.blue)

                    HStack {

                        Spacer()

                        Button(action: {
                            print("--------------------------------------------")
                            print("BUTTON InformationsViewV2")
                            showInformationsView = true
                        }) {
                            Image(systemName: "info.circle")
                                .accessibilityLabel("Undo")
                                .font(.system(size: 25))
                        }
                        .sheet(isPresented: $showInformationsView) {
                            InformationsViewV2(viewModel: viewModel)
                        }
                        
                        Button(action: {
                            
//                            viewModel.currentGame.players[0].remainingScore = viewModel.currentGame.gameType
                            print("--------------------------------------------")
                            print("DEBUG")
                            print("--------------------------------------------")
                            print("GAMETYPE : \(viewModel.currentGame.gameType)")
                            print("NOMBRE DE JOUEURS : \(viewModel.currentGame.players.count)")
                            print("NAME PLAYER 1 : \(viewModel.currentGame.players[0].name)")
                            print("REMAINGSCORE PLAYER 1 : \(viewModel.remainingScore(forPlayer: 0))")
                            print("NAME PLAYER 2 : \(viewModel.currentGame.players[1].name)")
                            print("REMAINGSCORE PLAYER 2 : \(viewModel.remainingScore(forPlayer: 1))")
                            print("NAME PLAYER 3 : \(viewModel.currentGame.players[2].name)")
                            print("REMAINGSCORE PLAYER 3 : \(viewModel.remainingScore(forPlayer: 2))")
                            print("NAME PLAYER 4 : \(viewModel.currentGame.players[3].name)")
                            print("REMAINGSCORE PLAYER 4 : \(viewModel.remainingScore(forPlayer: 3))")
                            print("CURRENT TURN : \(viewModel.currentGame.currentTurn)")
                            print("CURRENT PLAYER : \(players[currentPlayerIndex].name)")
                           
                            print("GAMETYPE : \(viewModel.currentGame.gameType)")

                        }) {
                            Image(systemName: "ladybug.circle")
                                .accessibilityLabel("Undo")
                                .font(.system(size: 25))
                        }
                        
                        Spacer()

                        Text("\(players[currentPlayerIndex].name)")
                            .fontWeight(.bold)

                        Spacer()

                        Text("Game \(gameCount)")
                        Text("- Turn \(viewModel.currentGame.currentTurn)")
                            .bold()

                        Spacer()

                        Button(action: {
                            print("--------------------------------------------")
                            print("BUTTON undoLastScore")
                        undoLastScore()
                        }) {
                            Image(systemName: "arrow.uturn.backward.circle")
                                .accessibilityLabel("Undo")
                                .font(.system(size: 25))
                        }
//                    .disabled(isUndoDisabled)
//                    .foregroundColor(isUndoDisabled ? .gray : .white)

                        Spacer()

                    }
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .frame(height: 55)

                ZStack {

                    Color(currentPlayerIndex == 0 ? .yellow : .gray)
                    
                    VStack {

                        Spacer()

                        HStack {
                            Text("\(players[0].name)")
                                .fontWeight(.bold)
                            Text("-  Average Score:  #")
                                .font(
                                    .system(size: 14))
//                         if isBustedPlayer1 {
//                             Text("- BUST")
//                                 .fontWeight(.bold)
//                                 .foregroundColor(.red)
//                                 .glowBorder(color: .black, lineWidth: 2)
//                         }
                        }

                        Button(action: {
                            print("--------------------------------------------")
                            print("BUTTON enterThrowScore PLAYER 1")
                            enterThrowScore = true
//                         isUndoDisabled = false
                        }) {
                            Text("\(viewModel.remainingScore(forPlayer: 0))")
                                .font(players.count > 3 ? .system(size: 80, weight: .bold, design: .default) : .system(size: 130, weight: .bold, design: .default))
                        }
                        .disabled(currentPlayerIndex != 0)

                        Spacer()

                    }
                }
                
                if players.count > 1 {

                    ZStack {
                        
                        Color(currentPlayerIndex == 1 ? .yellow : .gray)

                        VStack {

                            Spacer()

                            HStack {
                                Text("\(players[1].name)")
                                    .fontWeight(.bold)
                                Text("-  Average Score:  #")
                                    .font(
                                        .system(size: 14))
//                         if isBustedPlayer1 {
//                             Text("- BUST")
//                                 .fontWeight(.bold)
//                                 .foregroundColor(.red)
//                                 .glowBorder(color: .black, lineWidth: 2)
//                         }
                            }

                            Button(action: {
                                print("--------------------------------------------")
                                print("BUTTON enterThrowScore PLAYER 2")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("\(viewModel.remainingScore(forPlayer: 1))")
                                    .font(players.count > 3 ? .system(size: 80, weight: .bold, design: .default) : .system(size: 130, weight: .bold, design: .default))
                            }
                            .disabled(currentPlayerIndex != 1)

                            Spacer()

                        }
                    }
                }

                if players.count > 2 {

                    ZStack {

                        Color(currentPlayerIndex == 2 ? .yellow : .gray)

                        VStack {

                            Spacer()

                            HStack {
                                Text("\(players[2].name)")
                                    .fontWeight(.bold)
                                Text("-  Average Score:  #")
                                    .font(
                                        .system(size: 14))
//                         if isBustedPlayer1 {
//                             Text("- BUST")
//                                 .fontWeight(.bold)
//                                 .foregroundColor(.red)
//                                 .glowBorder(color: .black, lineWidth: 2)
//                         }
                            }

                            Button(action: {
                                print("--------------------------------------------")
                                print("BUTTON enterThrowScore PLAYER 3")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("\(viewModel.remainingScore(forPlayer: 2))")
                                    .font(players.count > 3 ? .system(size: 80, weight: .bold, design: .default) : .system(size: 130, weight: .bold, design: .default))
                            }
                            .disabled(currentPlayerIndex != 2)

                            Spacer()

                        }
                    }
                }

                if players.count > 3 {

                    ZStack {

                        Color(currentPlayerIndex == 3 ? .yellow : .gray)

                        VStack {

                            Spacer()

                            HStack {
                                Text("\(players[3].name)")
                                    .fontWeight(.bold)
                                Text("-  Average Score:  #")
                                    .font(
                                        .system(size: 14))
//                         if isBustedPlayer1 {
//                             Text("- BUST")
//                                 .fontWeight(.bold)
//                                 .foregroundColor(.red)
//                                 .glowBorder(color: .black, lineWidth: 2)
//                         }
                            }

                            Button(action: {
                                print("--------------------------------------------")
                                print("BUTTON enterThrowScore PLAYER 4")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("\(viewModel.remainingScore(forPlayer: 3))")
                                    .font(players.count > 3 ? .system(size: 80, weight: .bold, design: .default) : .system(size: 130, weight: .bold, design: .default))
                            }
                            .disabled(currentPlayerIndex != 3)

                            Spacer()

                        }
                    }
                }
            }
            .foregroundColor(.black)
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $enterThrowScore) {
                EnterThrowScoreViewV2(viewModel: viewModel, currentPlayerIndex: $currentPlayerIndex)
//                    .onAppear {
//                                if let firstPlayer = viewModel.currentGame.players.first {
//                                    let _ = firstPlayer.scores
//                                } else {
//                                }
//                            }
            }
            .onAppear {
                print("------------------------------")
                print("GAMEVIEW")
                print("------------------------------")
                viewModel.currentGame.players[0].remainingScore = viewModel.currentGame.gameType
                viewModel.currentGame.players[1].remainingScore = viewModel.currentGame.gameType
                viewModel.currentGame.players[2].remainingScore = viewModel.currentGame.gameType
                viewModel.currentGame.players[3].remainingScore = viewModel.currentGame.gameType
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    
    // FUNCTIONS ///////////////////
    
    private func undoLastScore() {
        print("----------------------------------------")
        print("Function undoLastScore in GameViewV2")

        // Calcul de l'index du joueur précédent
        var previousPlayerIndex = currentPlayerIndex - 1
        if previousPlayerIndex < 0 {
            previousPlayerIndex = viewModel.currentGame.players.count - 1
        }

        // Vérification si le joueur a des scores à annuler
        if !viewModel.currentGame.players[previousPlayerIndex].scores.isEmpty {
            // Retirer le dernier score du joueur précédent
            viewModel.currentGame.players[previousPlayerIndex].scores.removeLast()

            // Ajuster l'index du joueur actuel
            currentPlayerIndex = previousPlayerIndex

            // Ajuster le tour, si nécessaire
            if viewModel.currentGame.currentTurn > 1 {
                viewModel.currentGame.currentTurn -= 1
            }
        } else {
            print("No scores to undo for player \(viewModel.currentGame.players[previousPlayerIndex].name).")
        }
    }
}


// ///////////////////////////
// PREVIEW //////////////////

struct GameViewV2_Previews: PreviewProvider {
    static var previews: some View {
        let gameType = 180  // Assuming the game type is 501
        let viewModel = GameViewModel(gameType: gameType)  // Initialize the view model with the game type

        // Ensure we have exactly 4 players for the preview
        while viewModel.currentGame.players.count < 4 {
            viewModel.addPlayer()
        }

        // Assign names to players for the preview
        viewModel.currentGame.players[0].name = "Alice"
        viewModel.currentGame.players[1].name = "Bob"
        viewModel.currentGame.players[2].name = "Carol"
        viewModel.currentGame.players[3].name = "Dave"

        // Return the GameViewV2 with the configured viewModel
        return GameViewV2(selectedGame: gameType, players: viewModel.currentGame.players, viewModel: viewModel)
    }
}
