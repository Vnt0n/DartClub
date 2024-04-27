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
    @State private var currentTurn: Int = 0
    
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
                            undoLastScore()
                        }) {
                            Image(systemName: "info.circle")
                                .accessibilityLabel("Undo")
                                .font(.system(size: 25))
                        }
                        .sheet(isPresented: $showInformationsView) {
                            InformationsViewV2(players: players)
                        }
                        
                        Spacer()

                        Text("\(players[currentPlayerIndex].name)")
                            .fontWeight(.bold)

                        Spacer()

                        Text("Game #")
                        Text("- Turn #")
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
                            Text("300")
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
                                print("BUTTON enterThrowScore PLAYER 1")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("300")
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
                                print("BUTTON enterThrowScore PLAYER 1")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("300")
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
                                print("BUTTON enterThrowScore PLAYER 1")
                         enterThrowScore = true
//                         isUndoDisabled = false
                            }) {
                                Text("300")
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
                EnterThrowScoreViewV2(viewModel: viewModel, currentPlayerIndex: viewModel.currentGame.currentTurn % viewModel.currentGame.players.count)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    
    // FUNCTIONS ///////////////////
    
    private func undoLastScore() {
        viewModel.undoLastScore(forPlayer: viewModel.currentGame.currentTurn % viewModel.currentGame.players.count)
    }
    
}


// ///////////////////////////
// PREVIEW //////////////////

struct GameViewV2_Previews: PreviewProvider {
    static var previews: some View {
        // Définissez des joueurs de test
        let players = [
            Player(name: "Alice", scores: [[10, 20, 30]]),
            Player(name: "Bob", scores: [[15, 25, 35]]),
            Player(name: "Charlie", scores: [[20, 30, 40]]),
            Player(name: "Dana", scores: [[25, 35, 45]])
        ]
        
        // Créez une instance de GameViewModel avec un jeu de type 501 et des joueurs
        let gameType = 501
        let viewModel = GameViewModel(gameType: gameType, playerCount: players.count)
        
        // Affichez GameViewV2 pour tester
        GameViewV2(players: players, viewModel: viewModel)
    }
}

