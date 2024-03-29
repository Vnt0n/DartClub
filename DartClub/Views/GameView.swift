//
//  GameView.swift
//  DartClub
//
//  Created by Antoine on 26/03/2024.
//

import SwiftUI

struct GameView: View {
    
    var namePlayer1: String
    var namePlayer2: String
    var namePlayer3: String
    
    @State private var selectedPlayer: String = ""
    @State private var currentPlayerIndex: Int = 0
    
    @State private var scorePlayer1: Int = 501
    @State private var scorePlayer2: Int = 501
    @State private var scorePlayer3: Int = 501
    
    @State private var enterScore = false
    @State private var isGameOver = false
    
    @State private var disableOtherPlayerButtons: Bool = false
        
    private var playerNames: [String] {
        [namePlayer1, namePlayer2, namePlayer3].filter { !$0.isEmpty }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Color(currentPlayerIndex == 0 ? .yellow : .gray)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.top)
                    VStack {
                        Text(namePlayer1)
                        Button(action: {
                            enterScore = true
                            selectedPlayer = namePlayer1
                        }) {
                            Text("\(scorePlayer1)")
                                .font(.system(size: 140, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
                        .disabled(disableOtherPlayerButtons || currentPlayerIndex != 0)
                    }
                }
                
                ZStack {
                    Color(currentPlayerIndex == 1 ? .yellow : .gray)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.bottom)
                    VStack {
                        Text(namePlayer2)
                        Button(action: {
                            enterScore = true
                            selectedPlayer = namePlayer2
                        }) {
                            Text("\(scorePlayer2)")
                                .font(.system(size: 140, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
                        .disabled(disableOtherPlayerButtons || currentPlayerIndex != 1)
                    }
                }
                
                if !namePlayer3.isEmpty {
                    ZStack {
                        Color(currentPlayerIndex == 2 ? .yellow : .gray)
                            .frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.bottom)
                        VStack {
                            Text(namePlayer3)
                            Button(action: {
                                enterScore = true
                                selectedPlayer = namePlayer3
                            }) {
                                Text("\(scorePlayer3)")
                                    .font(.system(size: 140, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                            }
                            .disabled(disableOtherPlayerButtons || currentPlayerIndex != 2)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.horizontal)
            .sheet(isPresented: $enterScore) {
                EnterScoreView(playerName: selectedPlayer, namePlayer1: namePlayer1, namePlayer2: namePlayer2, namePlayer3: namePlayer3) { enteredScore in
                    
                    var newScore = 0
                    
                    switch selectedPlayer {
                    case namePlayer1:
                        scorePlayer1 -= Int(enteredScore) ?? 0
                        newScore = scorePlayer1
                    case namePlayer2:
                        scorePlayer2 -= Int(enteredScore) ?? 0
                        newScore = scorePlayer2
                    case namePlayer3:
                        scorePlayer3 -= Int(enteredScore) ?? 0
                        newScore = scorePlayer3
                    default:
                        break
                    }
                    if newScore <= 0 {
                        enterScore = false
                        isGameOver = true
                        DispatchQueue.main.async {
                            currentPlayerIndex = playerNames.firstIndex(of: selectedPlayer) ?? 0
                            let winnerName = selectedPlayer
                        }
                    } else {
                        currentPlayerIndex = (currentPlayerIndex + 1) % playerNames.count
                        disableOtherPlayerButtons = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            disableOtherPlayerButtons = false
                        }
                    }
                }
                .presentationDetents([.large])
            }
        }
        .navigationBarBackButtonHidden(true)
        .overlay(
            EmptyView()
        )
        .navigationDestination(isPresented: $isGameOver) {
            WinnerView(namePlayer: selectedPlayer)
        }
        .onChange(of: selectedPlayer) {
            if let index = playerNames.firstIndex(of: selectedPlayer) {
                currentPlayerIndex = index
            }
        }
        .onAppear {
            selectedPlayer = playerNames.first ?? ""
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(namePlayer1: "Player 1", namePlayer2: "Player 2", namePlayer3: "Player 3")
    }
}
